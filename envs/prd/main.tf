terraform {
  backend "s3" {
    bucket = "ono-terraform-handson"
    key    = "prd/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "${var.region}"
}

module "common" {
  source = "../../modules/common/"

  env                = "${var.env}"
  app_name           = "${var.app_name}"
  instance_types     = "${var.instance_types}"
  instance_counts    = "${var.instance_counts}"
  availability_zones = "${var.availability_zones}"
  vpc_id             = "${var.vpc_id}"
  vpc_cidrs          = "${var.vpc_cidrs}"
  public_subnet_ids  = "${var.public_subnet_ids}"
  private_subnet_ids = "${var.private_subnet_ids}"
  uploaded_key       = "${var.uploaded_key}"
}

module "prd" {
  source = "../../modules/prd/"

  env                = "${var.env}"
  app_name           = "${var.app_name}"
  instance_types     = "${var.instance_types}"
  instance_counts    = "${var.instance_counts}"
  availability_zones = "${var.availability_zones}"
  vpc_id             = "${var.vpc_id}"
  vpc_cidrs          = "${var.vpc_cidrs}"
  public_subnet_ids  = "${var.public_subnet_ids}"
  private_subnet_ids = "${var.private_subnet_ids}"
  uploaded_key       = "${var.uploaded_key}"
}
