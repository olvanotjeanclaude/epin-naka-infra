variable "aws_region" {
  default = "eu-central-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "epinaka-key"
}

variable "public_key_path" {
  description = "Path to your SSH public key"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI ID for eu-central-1"
}
