terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

backend "gcs" {
    bucket = "project-02-499004-tf-state" # TODO: replace with your state bucket
    prefix = "terraform-course/019-remote-state"
  # TODO: add a backend "gcs" block pointing at a state bucket you
  # created ahead of time (see README.md step 1)
}
}
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "example" {
  name                        = "${var.project_id}-exercise-019"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
}


# Reuse any small resource from an earlier exercise (e.g. a storage
# bucket) — the point of this exercise is the backend, not the
# resource itself.
