#!/bin/bash

# Define the default download URL for the latest Go version
LATEST_GO_URL="https://go.dev/dl/go1.22.4.linux-amd64.tar.gz"

if [[ -z "$GOLAND_INSTALL_VERSION" ]]; then
    echo "GOLAND_INSTALL_VERSION is not set. Installing the latest version of Go."
    DOWNLOAD_URL=$LATEST_GO_URL
else
    DOWNLOAD_URL="https://go.dev/dl/go$GOLAND_INSTALL_VERSION.linux-amd64.tar.gz"
fi

# Function to install Go
install_go() {
    echo "Downloading Go from $DOWNLOAD_URL..."
    wget --quiet --show-progress "$DOWNLOAD_URL" -O go.tar.gz

    echo "Extracting Go..."
    tar -xzf go.tar.gz

    echo "Moving Go to /usr/local..."
    sudo mv go /usr/local

    export_cmd="export PATH=$PATH:/usr/local/go/bin"

    echo "Setting up environment variables..."
    if ! grep -q "${export_cmd}"  ~/.profile; then
        echo "${export_cmd}" >> ~/.profile
        echo "${export_cmd}" >> ~/.bashrc
    fi

    echo "Go installation is complete."
    echo "Run 'source ~/.profile' or 'source ~/.bashvrc'"
}

# Check if Go is already installed
if [ -d "/usr/local/go" ]; then
    read -rp "Go is already installed. Do you want to remove the existing version? (y/n) " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "Removing the existing version of Go..."
        sudo rm -rf /usr/local/go
        install_go
    else
        echo "Exiting without installing Go."
        exit 1
    fi
else
    install_go
fi

