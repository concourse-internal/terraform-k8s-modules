variable "name" {}

variable "namespace" {}

variable "labels" {
  default = null
}

variable "annotations" {
  default = {}
}

variable "from-dir" {
  default = null
}

variable "from-files" {
  default = []
}

variable "from-file" {
  default = null
}

variable "from-map" {
  default = {}
}
