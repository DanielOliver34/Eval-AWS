resource "aws_instance" "server" {
  instance_type = var.instance_type
  ami = var.ami
  subnet_id = aws_subnet.evaltpsubnet.id
  vpc_security_group_ids = [aws_security_group.autoriser_tls.id]
  tags = {
    Name = "TP eval AWS"
  }
}
resource "aws_vpc" "evalvpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  
  tags = {
    Name = "Terraform VPC"
  }
}

resource "aws_subnet" "evaltpsubnet" {
  vpc_id            = aws_vpc.evalvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Terraform subnet"
  }
}

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

resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
}