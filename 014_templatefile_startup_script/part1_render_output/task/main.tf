terraform {
  required_version = ">= 1.7.0"
}

output "rendered_message_01" {
  value = templatefile("${path.module}/templates/welcome.tftpl", {
    name = var.your_name
  })
}

output "rendered_message_02" {
  value = templatefile("${path.module}/templates/welcome.tftpl", {
    name = "John"
  })
}


# TODO: create templates/welcome.tftpl (see README.md step 1)

# TODO: output "rendered_message" — render templates/welcome.tftpl
# with { name = var.your_name } using templatefile(). No provider or
# GCP resource is needed for this part.
