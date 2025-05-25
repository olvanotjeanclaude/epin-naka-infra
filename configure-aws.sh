#!/bin/bash

set -e

echo "AWS CLI Configuration for Terraform"

# Prompt user for credentials
read -p "Enter your AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -s -p "Enter your AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
echo
read -p "Enter default AWS region (e.g. eu-central-1): " AWS_REGION
read -p "Enter AWS profile name [default]: " AWS_PROFILE

# Default to "default" if empty
AWS_PROFILE=${AWS_PROFILE:-default}

# Create .aws directory if not present
mkdir -p ~/.aws
chmod 700 ~/.aws

# Write credentials file
cat > ~/.aws/credentials <<EOF
[$AWS_PROFILE]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOF

# Write config file
cat > ~/.aws/config <<EOF
[profile $AWS_PROFILE]
region = $AWS_REGION
output = json
EOF

chmod 600 ~/.aws/credentials ~/.aws/config

echo "AWS credentials configured for profile '$AWS_PROFILE'"
