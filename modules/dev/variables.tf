variable "env" {
  type = "string"
}

variable "app_name" {
  type = "string"
}

variable "instance_types" {
  type = "map"
}

variable "instance_counts" {
  type = "map"
}

variable "availability_zones" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}

variable "vpc_cidrs" {
  type = "list"
}

variable "public_subnet_ids" {
  type = "list"
}

variable "private_subnet_ids" {
  type = "list"
}

variable "uploaded_key" {
  type = "string"
}

variable "common_security_group_ids" {
  type = "map"
}
