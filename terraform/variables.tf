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
  default     = "C:/Users/maria/.ssh/ubuntu.pub"
}

variable "image_id" {
  description = "Disk image"
}

variable "subnet_id" {
  description = "Subnet"
  default     = "e9bj6mmfnn2uhv9f157s"
}

variable "service_account_key_file" {
  description = "key.json"
  default     = "./files/key.json"
}

variable "private_key_file" {
  description = "Connection private key"
}

variable "yandex_compute_instance_app_name" {
  description = "Yandex compute instance app name"
  default     = "reddit-app"
}

variable "vm_count" {
  description = "Amount of VM instances"
  default     = "1"
}
