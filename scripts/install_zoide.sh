#!/bin/bash

ZOXIDE_INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh"

curl -sSfL ${ZOXIDE_INSTALL_SCRIPT_URL}| sh

echo 'eval "$(zoxide init --cmd cd bash)"' >> ~/.bashrc
