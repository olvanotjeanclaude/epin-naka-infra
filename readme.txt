- **System Requirements**:
  - **Operating System:** Linux (Ubuntu/Debian recommended)
  - **AWS Account:** Required for provisioning. If unavailable, contact me for a test key.
  - **Software Dependencies:**
    - bash, sudo, apt-get
    - curl or wget
    - gnupg / gpg
    - software-properties-common
  - **Hardware Requirements:**
    - RAM: ≥ 1 GB (2 GB recommended)
    - Disk space: ≥ 2 GB free
    - CPU: 1 core minimum, 2+ cores recommended
  - **Network Requirements:** Internet access required to download packages and repositories
  - **Permissions:** Ability to run commands with sudo

- git clone https://github.com/olvanotjeanclaude/epin-naka-infra.git
- cd epin-naka-infra

- Install terraform + Ansible
   $ sudo chmod +x setup.sh
   $ sudo bash setup.sh
   $ terraform --version
   $ ansible --version
   #docs: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

- Setup ssh:
  $ chmod +x ssh-setup.sh
  $ bash ssh-setup.sh

- AWS CLI config:
  $ sudo apt install awscli
  $ aws configure
  Enter:
    - AWS Access Key ID : Copy access key (right click on terminal to paste)
    - AWS Secret Access Key: Copy Secret key
    - Default region (e.g., eu-central-1) : You can press enter to use default
    - Output format (json is fine)

- Settings Terraform
    $ cd terraform-aws
    $ cp terraform.tfvars.example terraform.tfvars

- Provision AWS
  $ terraform init
  $ terraform plan
  $ terraform apply  #it will prompt to confirm, say yes
  # Note the WebPublicIP = "3.121.162.168" for example

- Setup Ansible
  1. go to ansible folder: $ cd ../ansible
  2. $ nano hosts
  3. Copy the WebPublicIP to hosts like below:
     <WebPublicIP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/epinaka-key
  4. Ctrl + S (save) and Ctrl + X (Quit)
  5. $ ansible-playbook -i hosts site.yml # Run playbook (Server configurations + deployment)

- Access the project:
   * Backend server: http://<WebPublicIP> (Laravel run in docker on port 9000)
   * Socket Server: http://<WebPublicIP>:4000 (Socket server run in docker on port 4000)
   * Front end : http://<WebPublicIP>:3000 (Front end run in docker on port 3000)

- To Destroy the server:
  - $ terraform destroy
