
- requirement : Linux
- git clone https://github.com/olvanotjeanclaude/epin-naka-infra.git
- cd epin-naka-infra
- Install terraform + Ansible
   $ sudo chmod +x setup.sh
   $ sudo bash setup.sh
   $  terraform --version
   $ ansible --version
   
   #docs: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
- Generate ssh epinaka-key
   $bash ssh-setup.sh