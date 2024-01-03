variable "region" {
  description = "La région AWS dans laquelle créer les ressources"
  type        = string
  default     = "eu-west-3"
}
variable "access_key" {
  description = "La clé d'accès AWS"
  type        = string
  default     = "AKIA5ZY7AAPSGM4ZYNGZ"
}
variable "secret_key" {
  description = "La clé secrète AWS"
  type        = string
  default     = "W+MRCWiyZVPfaINaSQmojxNYB3e7ExbomwlWwiWJ"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "ami" {
  type = string
  default = "ami-0bd23a7080ec75f4d"
}
variable "vpc_cidr_block" {
  description = "Bloc CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "bucket" {
  type = string
  default = "evaltpawss3"
}
