variable "project_id" {
  description = "GCP project ID to deploy resources into."
  type        = string
}

variable "region" {
  description = "Region for the bucket and provider default."
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Deployment environment, used to build common_labels. Gets a validation block added in 005_variable_validation."
  type        = string
  default     = "dev"
}



# TODO: variable "project_id" {
#   type        = string
#   description = "GCP project ID to deploy resources into."
#   # no default — Terraform will require it (via terraform.tfvars or -var)
# }

# TODO: variable "region" {
#   type    = string
#   default = "us-central1"
# }

# TODO: variable "bucket_name" {
#   type = string
#   # no default — must be supplied, same reasoning as project_id
# }
