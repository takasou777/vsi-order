/******************************************
 Provider
 *****************************************/

variable "region" {
  type        = string
  default     = "jp-osa"
  description = "Region"
}

/******************************************
 Resource Group, Tags
 *****************************************/
variable "resource_group_name" {
  default     = "stakamura"
  description = "リソースグループ名"
}

variable "tags" {
  type        = list(string)
  default     = ["terraform"]
  description = "タグ名"
}

variable "ssh_key_names" {
  type        = list(string)
  default     = ["takamura-key", "satokota-key"]
  description = "sshキー名"
}
/******************************************
 VPC
 *****************************************/
variable "vpc_name" {
  type        = string
  default     = "vpc-takamura"
  description = "vpc名"
}

/******************************************
 Subnet
 *****************************************/
variable "subnet_name" {
  type        = string
  default     = "vpc-takamura-subnet1-1"
  description = "subnet名"
}


variable "sg_name" {
  type        = string
  default     = "vpc-takamura-security-group"
  description = "security group名"
}
/******************************************
 VSI
 *****************************************/
variable "vsi_name" {
  default = "takamura-tmp-instance"
  description = "VSI名"
}

variable "image_name" {
  default     = "ibm-centos-7-9-minimal-amd64-8"
  description = "OS イメージ名"
}
