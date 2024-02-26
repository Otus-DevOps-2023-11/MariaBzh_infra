variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "subnet_id" {
  description = "Subnet"
}

variable "private_key_file" {
  description = "Connection private key"
  default     = "~/.ssh/ubuntu"
}
