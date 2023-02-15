/******************************************
 Provider
 *****************************************/

variable "region" {
  type        = string
  default     = "jp-tok"
  description = "Region"
}

/******************************************
 Resource Group, Tags
 *****************************************/
variable "resource_group_name" {
  default     = "demo-common"
  description = "リソースグループ名"
}

variable "tags" {
  type        = list(string)
  default     = ["terraform"]
  description = "タグ名"
}

variable "ssh_name" {
  type        = string
  default     = "takamura-key"
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
  default     = "iac-vpc-subnet-zone1"
  description = "vpc名"
}


variable "debug-sg-name" {
  type        = string
  default     = "lamp-sg"
  description = "security group名"
}
/******************************************
 VSI
 *****************************************/
# image names can be determined with the cli command `ibmcloud is images`
variable "image_name" {
  description = "OS image for VSI deployments. Only tested with Centos"
  # default     = "ibm-redhat-9-0-minimal-amd64-1"
  default     = "ibm-centos-7-9-minimal-amd64-8"
}
