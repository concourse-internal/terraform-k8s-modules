variable "name" {}

variable "namespace" {}

variable "image" {
  default = "flowable/flowable-ui:6.6.0"
}

variable "replicas" {
  default = 1
}

variable ports {
  default = [
    {
      name = "http"
      port = 8080
    },
  ]
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