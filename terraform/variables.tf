variable "cloud_id" {
  description = "Cloud"
}

variable "folder_id" {
  description = "Folder"
}

variable "zone" {
  description = "Zone"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
  default     = "~/.ssh/ubuntu.pub"
}

variable "image_id" {
  description = "Disk image"
}

variable "subnet_id" {
  description = "Subnet"
  default     = "subnet_id"
}

variable "service_account_key_file" {
  description = "key.json"
  default     = "key.json"
}

variable "private_key_file" {
  description = "Connection private key"
  default = "~/.ssh/ubuntu"
}

variable "vm_count" {
  description = "Amount of VM instances"
  default     = "1"
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
