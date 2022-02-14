variable "org" {
    default = "hashicorp-se"
}
variable "tfc_token" { sensitive = true }
variable "aws_access_key" { sensitive = true }
variable "aws_secret_id" { sensitive = true }

variable "aws_regions" {
    type = list
    default = ["us-east-1", "us-east-2"]
}
