variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "vpc_id" {
  description = "ID of the existing VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS"
  type        = list(string)
}
