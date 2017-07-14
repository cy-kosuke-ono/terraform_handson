terraform {
  backend "s3" {
    bucket = "terraform-handson"
    key    = "stg/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "common" {
  source = "../../modules/common/"
}

module "stg" {
  source = "../../modules/stg/"
}
