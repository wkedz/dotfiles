# install nfs-tools
sudo apt update && install -y nfs-common nfs-kernel-server

# create nfs dir on host
sudo mkdir /var/nfs/shared -p

# change created dir user
sudo chown nobody:nogroup /var/nfs/shared

# create nfs-server config file
sudo vim /etc/exports

  # with content
  /var/nfs/shared    <CLIENT_IP>(rw,sync,no_subtree_check)
#no_root_squash - do not drop root credentials

# restart nfs-server
sudo systemctl restart nfs-kernel-server

#Adjust firewall on host
sudo ufw allow from <CLIENT_IP> to any port nfs

# mount shared dir on client
sudo apt-get update && sudo apt-get install -y nfs-common
sudo mount <NFS_SERVER_IP>:/var/nfs/shared /nfs/shared
