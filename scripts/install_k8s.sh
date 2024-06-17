#!/bin/bash

# Fetch the stable release version
stable_version=$(curl -L -s https://dl.k8s.io/release/stable.txt)

# Download kubectl and its SHA256 checksum
curl -LO "https://dl.k8s.io/release/${stable_version}/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/${stable_version}/bin/linux/amd64/kubectl.sha256"

# Verify the checksum
if ! echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check; then
    echo "Checksum verification failed."
    exit 1
fi

# Add kubectl to local/bin in order to use it
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

# Add kubectl to bashrc
echo "PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc

# Add kubectl autocompletion
sudo apt-get install bash-completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc


