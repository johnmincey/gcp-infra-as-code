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
  project = "project-02-499004" # TODO: your project ID
  region  = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name                        = "project-02-499004-exercise-002" # TODO: must be globally unique
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


# TODO: resource "google_storage_bucket" "my_bucket" {
#   name                        = "___"  # must be globally unique — include your project ID
#   location                    = "___"  # a region or multi-region, e.g. "US"
#   uniform_bucket_level_access = ___    # true
#
#   # Optional: the docs page above has an Argument Reference listing
#   # everything else this resource accepts — you'll use two more of
#   # them for the stretch goal below.
# }
