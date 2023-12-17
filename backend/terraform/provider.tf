# provider.tf
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "aws_region" {}

provider "aws" {
	region     = var.aws_region
	access_key = var.aws_access_key_id
	secret_key = var.aws_secret_access_key
}

terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
	backend "local" {
		path = ".tfstate/terraform.tfstate"
	}
}
