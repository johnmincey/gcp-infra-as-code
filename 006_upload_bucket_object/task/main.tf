terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "my_bucket" {
  name                        = "${var.project_id}-exercise-006" # TODO: must be globally unique
  location                    = "US"
  uniform_bucket_level_access = true

  # Stretch goal
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_object" "hello" {
  name   = "hello.txt"
  bucket = google_storage_bucket.my_bucket.name
  source = "${path.module}/hello.txt"

  # Optional: the google_storage_bucket_object docs page above has
  # more under Argument Reference, e.g. `content_type`.
}

# TODO: resource "google_storage_bucket" "this" {
#   # same shape as 002_create_storage_bucket / 003_variables_and_outputs —
#   # name it off var.project_id, location = var.region,
#   # uniform_bucket_level_access = true
# }

# TODO: resource "google_storage_bucket_object" "hello" {
#   name   = "hello.txt"
#   bucket = ___  # reference the bucket resource above — the
#                 # TYPE.NAME.ATTRIBUTE pattern from 001_connect_to_gcp,
#                 # pointing at whichever attribute holds its name
#   source = "hello.txt"
#
#   # Optional: the google_storage_bucket_object docs page above has
#   # more under Argument Reference, e.g. `content_type`.
# }
