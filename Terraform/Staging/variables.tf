#############################
# Google Project Variables
#############################
variable "google_project_id" {
  description = "The id of the project"
  type = string
  default = ""
}

variable "region" {
  description = "The region of the project"
  type = string
  default = ""
}

#############################
# Project Variables
#############################
variable "project_name" {
  description = "The name of the project"
  type = string
  default = ""
}

#############################
# Network Variables
#############################
variable "ipv6_access_type" {
  description = "The access type of the ipv6"
  type = string
  default = "INTERNAL" # Change to "EXTERNAL" if creating an external loadbalancer
}

variable "stack_type" {
  description = "The stack type of the ipv4/ipv6"
  type = string
  default = "IPV4_IPV6"
}

#############################
# Cluster Variables
#############################
# Set `deletion_protection` to `true` will ensure that one cannot
# accidentally delete this instance by use of Terraform.
variable "delete_protection" {
  description = "The delete protection of the cluster"
  type = bool
  default = false
}