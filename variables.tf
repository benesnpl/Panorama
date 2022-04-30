variable "name" {
  description = "Name for the Panorama instance."
  type        = string
}

variable "panorama_version" {
  description = "This is the Panorama Version you want to deploy"
  default     = "10.0.6"
  type        = string
}

variable "instance_type" {
  description = "Instance Size - This is the default/standard used on our other deployments - 16-32"
  type        = string
  default     = "c5.4xlarge"
}

variable "availability_zone" {
  description = "Availability zone in which Panorama will be deployed."
  type        = string
}

variable "ssh_key_name" {
  description = "AWS EC2 key pair name."
  type        = string
}

variable "create_public_ip" {
  description = "If true, create an Elastic IP address for Panorama."
  type        = bool
  default     = false
}

variable "private_ip_address" {
  description = "If provided, associates a private IP address to the Panorama instance."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch Panorama in."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate Panorama with."
  type        = list(any)
  default = ["sg-0ac798f1eab2d3ed2"]
}

