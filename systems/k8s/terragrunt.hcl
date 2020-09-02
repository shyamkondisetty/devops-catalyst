terraform {
  source = "git::ssh://git@github.com/DevOpsByExample/terraform-modules.git//k8s/digital_ocean?ref=master"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  k8s_cluster = {
    cluster_name = "devops-catalyst-systems"
    pod_cidr     = "10.12.0.0/16"
    service_cidr = "10.13.0.0/16"
    vpc_uuid     = null
    region       = "blr1"

    addons = {
      ingress      = {
        enabled    = true
      }
      ccm          = {
        enabled    = true
      }
      external_dns = null
      cert_manager = null
      ebs          = null

      csi = {
        enabled    = true
        upgrade    = false
      }
    }

    primary = [
      {
        user   = "root"
        tags   = ["k8s","systems","primary"]
        image  = "ubuntu-18-04-x64"
        size   = "s-2vcpu-2gb"
        labels = []
      },
    ]

    node_pools = [
      {
        count  = 2
        name   = "systems-highcpu"
        user   = "root"
        image  = "ubuntu-18-04-x64"
        size   = "s-4vcpu-8gb"
        tags   = ["k8s","systems", "node"]
        labels = [
          {
            name  = "size"
            value = "highcpu"
          },
          {
            name  = "env"
            value = "systems"
          },
        ]
      }
    ]
  }
}
