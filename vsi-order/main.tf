/******************************************
 Resource Group
 *****************************************/
data "ibm_resource_group" "this" {
  name = var.resource_group_name
}

/******************************************
 VPC
 *****************************************/
data "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

/******************************************
 Subnet
 *****************************************/
data "ibm_is_subnet" "zone1" {
  name = var.subnet_name
}

/******************************************
 Image
 *****************************************/
data "ibm_is_image" "os" {
  name = var.image_name
}

/******************************************
 ssh
 *****************************************/
data "ibm_is_ssh_key" "ssh_keys" {
  count = length(var.ssh_key_names)
  name = var.ssh_key_names[count.index]
}

/******************************************
 Security group
 *****************************************/
data "ibm_is_security_group" "sg" {
  name = var.sg_name
}

/******************************************
 VSI
 *****************************************/

resource "ibm_is_instance" "virtual_instance" {
  name    = var.vsi_name
  vpc     = data.ibm_is_vpc.vpc.id
  zone    = format("%s-1", var.region)
  keys    = data.ibm_is_ssh_key.ssh_keys.*.id
  image   = data.ibm_is_image.os.id
  profile = "bx2-2x8"
  metadata_service_enabled  = false
  resource_group = data.ibm_resource_group.this.id


  primary_network_interface {
    subnet = data.ibm_is_subnet.zone1.id
    security_groups = [data.ibm_is_security_group.sg.id]
    allow_ip_spoofing = false
  }
}

resource "ibm_is_floating_ip" "iac-fip" {
  name   = "iac-floating-ip-debug"
  target = ibm_is_instance.virtual_instance.primary_network_interface[0].id
}

/* primary_ipv4_address deprecation
output "primary_ipv4_address" {
  value = ibm_is_instance.iac_instance.primary_network_interface.0.primary_ip.0.address // use this instead
}
*/
