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
