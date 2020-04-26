resource "k8s_apiextensions_k8s_io_v1beta1_custom_resource_definition" "servicerolebindings_rbac_istio_io" {
  metadata {
    annotations = {
      "helm.sh/resource-policy" = "keep"
    }
    labels = {
      "app"      = "mixer"
      "chart"    = "istio"
      "heritage" = "Tiller"
      "istio"    = "rbac"
      "package"  = "istio.io.mixer"
      "release"  = "istio"
    }
    name = "servicerolebindings.rbac.istio.io"
  }
  spec {

    additional_printer_columns {
      json_path   = ".spec.roleRef.name"
      description = "The name of the ServiceRole object being referenced"
      name        = "Reference"
      type        = "string"
    }
    additional_printer_columns {
      json_path   = ".metadata.creationTimestamp"
      description = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
      name        = "Age"
      type        = "date"
    }
    group = "rbac.istio.io"
    names {
      categories = [
        "istio-io",
        "rbac-istio-io",
      ]
      kind      = "ServiceRoleBinding"
      list_kind = "ServiceRoleBindingList"
      plural    = "servicerolebindings"
      singular  = "servicerolebinding"
    }
    scope = "Namespaced"
    subresources {
      status = {
      }
    }
    validation {
      open_apiv3_schema = <<-JSON
        {
          "properties": {
            "spec": {
              "description": "Configuration for Role Based Access Control. See more details at: https://istio.io/docs/reference/config/security/istio.rbac.v1alpha1.html",
              "properties": {
                "actions": {
                  "items": {
                    "properties": {
                      "constraints": {
                        "description": "Optional.",
                        "items": {
                          "properties": {
                            "key": {
                              "description": "Key of the constraint.",
                              "format": "string",
                              "type": "string"
                            },
                            "values": {
                              "description": "List of valid values for the constraint.",
                              "items": {
                                "format": "string",
                                "type": "string"
                              },
                              "type": "array"
                            }
                          },
                          "type": "object"
                        },
                        "type": "array"
                      },
                      "hosts": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "methods": {
                        "description": "Optional.",
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notHosts": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notMethods": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notPaths": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notPorts": {
                        "items": {
                          "format": "int32",
                          "type": "integer"
                        },
                        "type": "array"
                      },
                      "paths": {
                        "description": "Optional.",
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "ports": {
                        "items": {
                          "format": "int32",
                          "type": "integer"
                        },
                        "type": "array"
                      },
                      "services": {
                        "description": "A list of service names.",
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      }
                    },
                    "type": "object"
                  },
                  "type": "array"
                },
                "mode": {
                  "enum": [
                    "ENFORCED",
                    "PERMISSIVE"
                  ],
                  "type": "string"
                },
                "role": {
                  "format": "string",
                  "type": "string"
                },
                "roleRef": {
                  "description": "Reference to the ServiceRole object.",
                  "properties": {
                    "kind": {
                      "description": "The type of the role being referenced.",
                      "format": "string",
                      "type": "string"
                    },
                    "name": {
                      "description": "The name of the ServiceRole object being referenced.",
                      "format": "string",
                      "type": "string"
                    }
                  },
                  "type": "object"
                },
                "subjects": {
                  "description": "List of subjects that are assigned the ServiceRole object.",
                  "items": {
                    "properties": {
                      "group": {
                        "format": "string",
                        "type": "string"
                      },
                      "groups": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "ips": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "names": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "namespaces": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notGroups": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notIps": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notNames": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "notNamespaces": {
                        "items": {
                          "format": "string",
                          "type": "string"
                        },
                        "type": "array"
                      },
                      "properties": {
                        "additionalProperties": {
                          "format": "string",
                          "type": "string"
                        },
                        "description": "Optional.",
                        "type": "object"
                      },
                      "user": {
                        "description": "Optional.",
                        "format": "string",
                        "type": "string"
                      }
                    },
                    "type": "object"
                  },
                  "type": "array"
                }
              },
              "type": "object"
            }
          },
          "type": "object"
        }
        JSON
    }

    versions {
      name    = "v1alpha1"
      served  = true
      storage = true
    }
  }
}