/******************************************
 Variables
 *****************************************/
variable "message" {
  default = "Hello World!"
}

variable "file_name" {
  default = "helloworld.txt"
}


/******************************************
 Output
 *****************************************/
output "message" {
  value = var.message
}

output "file_name" {
  value = var.file_name
}

/******************************************
 Main
 *****************************************/
resource "local_file" "helloworld" {
  content  = var.message
  filename = var.file_name
}
