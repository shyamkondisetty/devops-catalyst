generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "devops-catalyst-prabhu"
    workspaces {
      name = "systems-${path_relative_to_include()}"
    }
  }
}
EOF
}