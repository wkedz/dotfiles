#!/bin/bash


echo ' 
if [ -n "${BASH_VERSION}" ]; then
    if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
    fi
fi
' >> ~/.bash_profile
