variable "app_name" {
  default = "tf-handson"
}

variable "env" {
  default = "stg"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "availability_zones" {
  default = [
    "ap-northeast-1a",
    "ap-northeast-1c",
  ]
}

variable "vpc_id" {
  default = ""
}

variable "vpc_cidrs" {
  default = []
}

variable "public_subnet_ids" {
  default = []
}

variable "private_subnet_ids" {
  default = []
}

variable "instance_types" {
  default = {}
}

variable "instance_counts" {
  default = {}
}

variable "uploaded_key" {
  default = ""
}
