variable "app_name" {
  default = "tf-handson"
}

variable "env" {
  default = "dev"
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
  default = "vpc-b1e862d5"
}

variable "vpc_cidrs" {
  default = [
    "10.200.0.0/16",
  ]
}

variable "public_subnet_ids" {
  default = [
    "subnet-42c29134",
    "subnet-f96ff3a1",
  ]
}

variable "private_subnet_ids" {
  default = [
    "subnet-48c2913e",
    "subnet-0b6af653",
  ]
}

variable "instance_types" {
  default = {
    "test" = "t2.micro"
  }
}

variable "instance_counts" {
  default = {}
}

variable "uploaded_key" {
  default = "cy-kosuke-ono-tech_pf"
}
