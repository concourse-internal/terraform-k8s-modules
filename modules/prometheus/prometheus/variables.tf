variable "name" {}

variable "namespace" {}

variable "replicas" {
  default = 1
}

variable "ports" {
  default = [
    {
      name = "http"
      port = 9090
    },
  ]
}

variable "image" {
  default = "prom/prometheus:v2.16.0"
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

variable "storage" {}

variable "storage_class" {}

variable "volume_claim_template_name" {
  default = "pvc"
}

// path to config.yml, e.g. ${path.module}/prometheus.yml
variable "config_file" {
  default = ""
}
