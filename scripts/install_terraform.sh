#!/bin/bash

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "Please type 'yes' to install or 'no' to exit:"

read userInput

if [[ "$userInput" == "yes" ]]
then
    echo "You have chosen to proceed. The script will continue..."
elif [[ "$userInput" == "no" ]]
then
    echo "You have chosen to exit. The script will stop."
    exit 0
else
    echo "Invalid input. Please type either 'yes' or 'no'."
    exit 1
fi

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform
