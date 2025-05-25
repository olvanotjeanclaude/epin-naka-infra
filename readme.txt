
- requirement : Linux
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
- Setup aws:
  $ sudo chmod +x configure-aws.sh  
- Settings
    $ cd terraform-aws/
    $ cp terraform.tfvars.example terraform.tfvars
- Start
  $ terraform init
  $ terraform plan