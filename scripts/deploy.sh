#!/bin/bash

set -e  # exit on error

cd "$(dirname "$0")/.."  

echo "[+] Applying Terraform..."
cd terraform
terraform apply -auto-approve

echo "[+] Generating Ansible inventory..."
cd ../scripts
./generate_inventory.sh

echo "[+] Running Ansible playbook..."
cd ../ansible
ansible-playbook -i inventory playbook.yml
