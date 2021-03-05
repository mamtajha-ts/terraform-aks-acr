variable "postgres_name" {
  type    = string
  default = "postgresmjts"
}

variable "admin_login" {
  type    = string
  default = "postgresuser"
}

variable "admin_password" {
  type    = string
  default = "Passw0rd@123j"
}

variable "sku_name" {
  type    = string
  default= "B_Gen5_1"
}


variable "virtual_network_rule" {
  type    = bool
  default= "false"
}
