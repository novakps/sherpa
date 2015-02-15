#!/bin/sh

if type ansible; then
    echo Ansible is already installed.
else
    echo Ansible is not installed. Installing...
    pip install ansible
fi
