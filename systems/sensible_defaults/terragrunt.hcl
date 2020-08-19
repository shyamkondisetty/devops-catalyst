terraform {
  source = "git::ssh://git@github.com/DevOpsByExample/terraform-modules.git//sensible_defaults?ref=master"
}

include {
  path = find_in_parent_folders()
}

dependency "k8s" {
  config_path = "../k8s"

  mock_outputs = {
    kubeconfig_path = "dummy"
  }
}

inputs = {
  kubeconfig_path = dependency.k8s.outputs.kubeconfig_path
  install_ci = true
}