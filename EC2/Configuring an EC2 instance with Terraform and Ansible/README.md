# EC2 Provisioning and Configuration with Terraform & Ansible

This project provisions an EC2 instance using **Terraform** and configures it with **Ansible** to deploy a basic **Flask application**.

---

##  Folder Structure
```
Configuring an EC2 instance with Terraform and Ansible/
├── ansible/
│   ├── playbook.yml
│   └── inventory
├── flask app/
│   └── app.py
├── scripts/
│   └── deploy.sh
│   └── generate_inventory.sh
├── terraform/
│   └── modules
│   │  └── ec2
│   │  │  ├── main.tf
│   │  │  └── variables.tf
│   ├── main.tf
│   ├── providers.tf
│   └── outputs.tf
```

##  How it works
1. **Terraform** provisions an EC2 instance.
2. The public IP is extracted and written to an Ansible inventory file.
3. **Ansible** connects to the EC2 instance via SSH and:
   - Updates system packages
   - Installs Python 3, pip, and Flask
   - Deploys a Flask application
  
  
## Prerequisites
- AWS account with access key credentials configured
- Terraform installed
- Ansible

**NOTE:** Ansible is only available on linux machines, thus windows users use WSL as an alternative.(Although there might be slight things to take note of here)
 
## Setup and Usage
1. Clone the repository

```bash
git clone <your-repo-url>
cd "aws-projects/ec2/config of ec2 using terraform/"
```
2. Deploy with One Command
   
```bash
./scripts/deploy.sh
```
This script will:

- Navigate to the Terraform directory

- Initialize and apply the Terraform configuration

- Extract the EC2 public IP

- Generate an Ansible inventory file

- Run the Ansible playbook to configure the instance














