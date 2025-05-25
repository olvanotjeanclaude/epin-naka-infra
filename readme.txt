
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

- Start
  $ terraform init
  $ terraform plan