#!/bin/bash

set -e

# Ensure system is up to date
echo "Updating system and installing prerequisites..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl wget gpg

# -----------------------------
# Install Terraform
# -----------------------------
echo "Installing Terraform..."

# Add HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Verify key fingerprint (optional but informative)
echo "Verifying HashiCorp GPG key..."
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Add HashiCorp repository
UBUNTU_CODENAME=$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs)
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $UBUNTU_CODENAME main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install Terraform
sudo apt-get update
sudo apt-get install -y terraform

# -----------------------------
# Install Ansible
# -----------------------------
echo "Installing Ansible..."

# Add Ansible GPG key
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | \
sudo gpg --dearmor -o /usr/share/keyrings/ansible-archive-keyring.gpg

# Add Ansible PPA
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | \
sudo tee /etc/apt/sources.list.d/ansible.list

# Update and install Ansible
sudo apt-get update
sudo apt-get install -y ansible

echo "Installation complete: Terraform and Ansible are installed."
