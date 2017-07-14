terraform {
  backend "s3" {
    bucket = "terraform-handson"
    key    = "prd/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "common" {
  source = "../../modules/common/"
}

module "prd" {
  source = "../../modules/prd/"
}
