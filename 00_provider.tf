#Déclaration de la version de Terraform et des configurations globales
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Configuration du fournisseur AWS
provider "aws" {
  region     = var.region
  access_key = var.access_key 
  secret_key = var.secret_key
}
