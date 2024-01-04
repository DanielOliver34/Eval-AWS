#Définition de la variable pour spécifier la région AWS
variable "region" {
  description = "La région AWS dans laquelle créer les ressources"
  type        = string
  default     = "eu-west-3"
}

#Définition de la variable pour la clé d'accès AWS
variable "access_key" {
  description = "La clé d'accès AWS"
  type        = string
  default     = "xxxxxxxxx"
}

#Définition de la variable pour la clé secrète AWS
variable "secret_key" {
  description = "La clé secrète AWS"
  type        = string
  default     = "xxxxxxxxxx"
}

#Définition de la variable pour le type d'instance
variable "instance_type" {
  type = string
  default = "t2.micro"
}

#Définition de la variable pour l'ID AMI
variable "ami" {
  type = string
  default = "ami-0bd23a7080ec75f4d"
}

#Définition de la variable pour le bloc CIDR du VPC
variable "vpc_cidr_block" {
  description = "Bloc CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

#Définition de la variable pour le nom du bucket S3
variable "bucket" {
  type = string
  default = "evaltpawss3"
}
