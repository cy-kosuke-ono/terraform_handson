terraform {
  backend "s3" {
    bucket = "ono-terraform-handson"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "common" {
  source = "../../modules/common/"
}

module "dev" {
  source = "../../modules/dev/"
}
