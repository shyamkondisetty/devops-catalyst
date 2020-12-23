terraform {
  source = "git::ssh://git@github.com/twCatalyst/terraform-modules.git//k8s/aws-eks?ref=master"
}

include {
  path = find_in_parent_folders()
}

inputs = {
}
