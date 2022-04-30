provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "panorama_sg"
  description = "Basic communication for Panorama"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.rules_inbound_sg
    content {
      from_port = ingress.value["port"]
      to_port = ingress.value["port"]
      protocol = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_block"]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
