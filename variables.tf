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

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "blog"
}


