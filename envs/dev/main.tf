terraform {
  backend "s3" {
    bucket = "terraform-vas-content"
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
