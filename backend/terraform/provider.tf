# provider.tf
variable "aws_region" {}

provider "aws" {
	region     = var.aws_region
}

terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
	backend "s3" {
		bucket  = "favo-system"
		region  = "ap-northeast-1"
		key     = "terraform.tfstate"
		encrypt = true
	}
	# backend "local" {
	# 	path = "tflocal.tfstate"
	# }
}
