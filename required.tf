terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      version = ">= 5.6.2"
      source  = "hashicorp/aws"
    }
  }
}
