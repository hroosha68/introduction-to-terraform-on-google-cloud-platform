variable "project_id" {
  description = "The project ID to deploy resources"
  type        = string
  default     = "learning-terraform-505110"
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-west1"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "app"
}

variable "network_ip_range" {
  description = "The IP range for the VPC network"
  type        = string
  default     = "10.2.0.0/16"
}

variable "project_image" {
  description = "The project to get the image from"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "image_family" {
  description = "The image family to use for the instance"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "blog"
}

variable "machine_type" {
  description = "The machine type for the instance"
  type        = string
  default     = "e2-micro"
}

