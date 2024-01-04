#Déclaration d'une instance EC2 AWS en l'associant au subnet et au security group
resource "aws_instance" "server" {
  instance_type = var.instance_type
  ami = var.ami
  subnet_id = aws_subnet.evaltpsubnet.id
  vpc_security_group_ids = [aws_security_group.autoriser_tls.id]
  tags = {
    Name = "TP eval AWS"
  }
}

#Déclaration d'un VPC AWS en utilisant la variable pour le bloc CIDR du VPC
resource "aws_vpc" "evalvpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  
  tags = {
    Name = "Terraform VPC"
  }
}

#Déclaration d'un sous-réseau AWS
resource "aws_subnet" "evaltpsubnet" {
  vpc_id            = aws_vpc.evalvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Terraform subnet"
  }
}

#Déclaration d'un groupe de sécurité AWS pour autoriser le traffic TLS entrant et sortant depuis n'importe qu'elle adresse IP
resource "aws_security_group" "autoriser_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.evalvpc.id
  ingress {
    description      = "TLS depuis VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "autoriser_tls"
  }
}

#Déclaration d'un bucket AWS S3
resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
}
