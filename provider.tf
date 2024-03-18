terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.8.0"
    }
  }
}

# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "dpt-mzc"

#     workspaces {
#       name = "yejik-sentinel-test"
#     }
#   }
# }

provider "aws" {
  region = "ap-northeast-2"
}
