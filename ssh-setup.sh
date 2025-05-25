#!/bin/bash

set -e

# Define key name and path
KEY_NAME="epinaka-key"
KEY_PATH="$HOME/.ssh/$KEY_NAME"

mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Generate SSH key (no passphrase)
if [ -f "$KEY_PATH" ]; then
    echo "SSH key '$KEY_NAME' already exists at $KEY_PATH"
else
    echo "Generating SSH key as '$KEY_NAME'..."
    ssh-keygen -t rsa -b 4096 -f "$KEY_PATH" -N "" -C "epinaka@$(hostname)"
    echo "SSH key generated:"
    echo "Private key: $KEY_PATH"
    echo "Public key: $KEY_PATH.pub"
fi

# Show public key
echo "Here is your public key:"
cat "$KEY_PATH.pub"
