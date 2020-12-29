terraform {
  source = "git::ssh://git@github.com/twCatalyst/terraform-modules.git//sensible_defaults?ref=master"
}

include {
  path = find_in_parent_folders()
}

dependency "k8s" {
  config_path = "../k8s"

  mock_outputs = {
    kubeconfig_path = "dummy"
    cloud_provider = "dummy-cloud_provider"
    region = "dummy-region"
    cluster_name = "dummy-cluster-name"
    cluster_autoscaler_role_arn = "dummy-autoscaler-role-arn"
  }
}

inputs = {
  kubeconfig_path = dependency.k8s.outputs.kubeconfig_path
  cloud_provider = dependency.k8s.outputs.cloud_provider
  region = dependency.k8s.outputs.region
  cluster_name = dependency.k8s.outputs.cluster_name
  cluster_autoscaler_role_arn = dependency.k8s.outputs.cluster_autoscaler_role_arn

  install_ci = true
  install_nginx = true
  install_cluster_autoscaler_aws = true
}