variable "cloud_id" {
  description = "Cloud"
  default     = "b1gqiitqjak6fh4abe4v"
}

variable "folder_id" {
  description = "Folder"
  default     = "b1g8f5lm212bm1qv4j2o"
}

variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
  default     = "C:/Users/maria/.ssh/ubuntu.pub"
}

variable "image_id" {
  description = "Disk image"
  default     = "fd8jce2s5dpe2aphglak"
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
  default = "Connection private key"
}

variable "yandex_compute_instance_app_name" {
  description = "Yandex compute instance app name"
  default     = "reddit-app"
}
