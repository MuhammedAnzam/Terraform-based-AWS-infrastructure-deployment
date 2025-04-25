variable "db_username" {}
variable "db_password" {}
variable "multi_az" {}
variable "allocated_storage" {}
variable "instance_class" {}
variable "db_name" {}
variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}
