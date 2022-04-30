terraform {
  required_version = ">= 0.13.7, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.10"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
# In this part you browse for the newest AMI for Panorama - Source is the AWS Market place and AMI is in BYOL

data "aws_ami" "panorama_ami" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["Panorama-AWS-*"]
  }
}  

module "sec-groups" {
  source  = "app.terraform.io/gbenetatos_Org/sec-groups/aws"
  version = "1.0.2"
}

  # Create the Panorama Instance
resource "aws_instance" "Panorama" {
  ami                                  = data.aws_ami.panorama_ami.id
  instance_type                        = var.instance_type
  availability_zone                    = var.availability_zone
  key_name                             = var.ssh_key_name
  private_ip                           = var.private_ip_address
  subnet_id                            = var.subnet_id
  vpc_security_group_ids               = sec-groups.allow_tls.sg_id
  disable_api_termination              = false
  instance_initiated_shutdown_behavior = "stop"
  ebs_optimized                        = true
  monitoring                           = false

  root_block_device {
    delete_on_termination = true
  }

}



