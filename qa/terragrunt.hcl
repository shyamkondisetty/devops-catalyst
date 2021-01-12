generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "thoughtworks"
    workspaces {
      name = "qa-${path_relative_to_include()}"
    }
  }
}
EOF
}