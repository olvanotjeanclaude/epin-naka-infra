provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "access_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web_server" {
  # ami           = var.ami_id
  ami           = "ami-03250b0e01c28d196" #Ubuntu 22.04 AMI ID for eu-central-1
  instance_type = var.instance_type
  key_name      = aws_key_pair.access_key.key_name
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "production-app-server"
  }
}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web_server.id
  state       = "running"
}

output "WebPublicIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web_server.public_ip
}

output "WebPrivateIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web_server.private_ip
}
