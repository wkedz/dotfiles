#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update -y

# Install dependencies for pyenv
echo "Installing dependencies for pyenv..."
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# Clone pyenv repository
if [[ ! -d "$HOME/.pyenv" ]]; then
    echo "Cloning pyenv repository from GitHub..."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
else
    echo "pyenv is already installed in $HOME/.pyenv"
    exit 0
fi

# Set up environment variables
echo "Setting up environment variables..."
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc

# Add pyenv init to shell
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

# Apply changes to current shell session
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

echo "pyenv installation is complete."

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo "pyenv-virtualenv installation is complete."

