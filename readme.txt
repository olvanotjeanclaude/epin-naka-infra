
- requirement : Linux, aws account, if not contact me to provider you the key for test purpose
- git clone https://github.com/olvanotjeanclaude/epin-naka-infra.git
- cd epin-naka-infra
- Install terraform + Ansible
   $ sudo chmod +x setup.sh
   $ sudo bash setup.sh
   $ terraform --version
   $ ansible --version
   #docs: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

- Setup ssh:
  $ sudo chmod +x ssh-setup.sh 
  $ sudo bash ssh-setup.sh

- AWS CLI config:
  $ sudo apt install awscli 
  $ aws configure
  Enter:
    - AWS Access Key ID
    - AWS Secret Access Key
    - Default region (e.g., eu-central-1)
     Output format (json is fine)

- Settings
    $ cd terraform-aws
    $ cp terraform.tfvars.example terraform.tfvars

- Provision AWS
  $ terraform init
  $ terraform plan 
  $ terraform apply  #it prompt to confirm, say yes
  # Note the WebPublicIP = "3.121.162.168" for example

- Setup Ansible
  1. go to ansible folder: $ cd ../ansible
  2. Copy the WebPublicIP to hosts like below:
   <WebPublicIP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/epinaka-key
  3. $  ansible-playbook -i hosts site.yml # Run playbook

- Access the project:
   * Backend server: http://3.121.162.168 (Laravel run in docker on port 9000)
   * Socket Server: http://3.121.162.168:4000 (Socket server run in docker on port 4000)
   * Front end : http://3.121.162.168:3000 (Front end run in dokcer on port 3000)
   
