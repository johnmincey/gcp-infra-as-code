variable "name" {
  description = "Globally unique bucket name."
  type        = string
}

variable "location" {
  description = "Bucket location."
  type        = string
  default     = "US"
}

variable "age_days" {
  description = "Delete objects older than this many days."
  type        = number
  default     = 30
}


# TODO: define the module's inputs, e.g.:
# variable "name"     { type = string }
# variable "location" { type = string, default = "US" }
# variable "age_days" { type = number, default = 30 }
