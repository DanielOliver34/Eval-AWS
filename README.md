# Evaluation AWS Terraform

Ce projet Terraform vise à créer une infrastructure de base dans AWS, comprenant un VPC, une instance EC2, un groupe de sécurité, et utilise un bucket S3 comme backend pour le stockage de l'état Terraform.

## Prerequis & Installation

Avant de commencer, assurez-vous de disposer des éléments suivants :

1. **Compte AWS** : Assurez-vous d'avoir un compte AWS valide avec les droits nécessaires pour créer des ressources telles que des VPC, des instances EC2, des groupes de sécurité, et des buckets S3.
Lien AWS : [Url de connexion](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26nc2%3Dh_ct%26src%3Dheader-signin%26state%3DhashArgsFromTB_eu-north-1_9a08af25ee519b2d&client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&forceMobileApp=0&code_challenge=Akgrkv3uhqMKkVSO27mGK6MgS_GgFqmyo8Df-8DAfzA&code_challenge_method=SHA-256).

2. **Installation VsCode** : [Url d'installation](https://code.visualstudio.com/download)

3. **Installation Terraform** : [Url d'installation](https://developer.hashicorp.com/terraform/install)

4. **Installation AWS CLI** : [Url d'installation](https://aws.amazon.com/fr/cli/)

2. **Clés d'accès et secrète AWS** : 
Les clés d'accès AWS (AWS Access Key ID et AWS Secret Access Key) sont générées dans la console AWS Identity and Access Management (IAM).

## Contenu du Projet

Le projet est structuré comme suit :

**provider.tf**: Fichier contenant la configuration du fournisseur AWS avec les clés d'accès et secrète faisant référence aux valeurs configurés dans le fichier variables.tf.

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key 
  secret_key = var.secret_key
}

```

**variables.tf**: Fichier contenant les déclarations de variables Terraform utilisées dans ressources.tf.
Ci-dessous, déclaration de la variable de type string et possédant la valeur "eu-west-3".

```bash
variable "region" {
  description = "La région AWS dans laquelle créer les ressources"
  type        = string
  default     = "eu-west-3"
}

```

**ressources.tf**: Fichier principal contenant la configuration Terraform pour les ressources principales (VPC, EC2, Security Group). Ci-dessous, configuration de l'instance EC2 en associant subnet et groupe de sécurité.

```bash
resource "aws_instance" "server" {
  instance_type = var.instance_type
  ami = var.ami
  subnet_id = aws_subnet.evaltpsubnet.id
  vpc_security_group_ids = [aws_security_group.autoriser_tls.id]
  tags = {
    Name = "TP eval AWS"
  }
}

```

## Commande Terraform

```python
# 1. Initialisez votre configuration pour installer les dépendances nécessaires
Terraform init

# 2. Prévisualiser les changements planifiés sur votre infrastructure
Terraform plan

# 3. Appliquer les changements à l'infrastructure réelle
Terraform apply

# 4. Décommissionnement de toute l'infrastructure
Terraform apply

```

## Accès Projet

Le projet est disponible depuis le repository suivant : [GitHub](https://github.com/DanielOliver34/Eval-AWS) 
