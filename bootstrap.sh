#!/bin/sh
if type pip; then
    echo Pip is already installed.
else
    sudo easy_install pip
fi

if type ansible; then
    echo Ansible is already installed.
else
    echo Ansible is not installed. Installing...
    pip install ansible
fi
