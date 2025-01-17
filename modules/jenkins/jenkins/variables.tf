variable "name" {}

variable "namespace" {}

variable "ports" {
  default = [
    {
      name = "http"
      port = 8080
    },
    {
      name = "slave"
      port = 50000
    },
  ]
}

variable "image_pull_secrets" {
   default = []
}

variable "image" {
  default = "registry.mgmt-dev.concourselabs.info/jenkins:latest"
}

variable "env" {
  default = []
}

variable "annotations" {
  default = {}
}

variable "overrides" {
  default = {}
}

variable "resources" {
  default = {
    requests = {
      cpu    = "500m"
      memory = "500Mi"
    }
    limits = {
      cpu    = "2"
      memory = "1Gi"
    }
  }
}

variable "casc_config_map_name" {}

variable "pvc_name" {}

