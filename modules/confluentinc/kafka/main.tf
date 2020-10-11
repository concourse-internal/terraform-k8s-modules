locals {
  parameters = {
    name        = var.name
    namespace   = var.namespace
    annotations = var.annotations
    replicas    = var.replicas
    ports       = var.ports

    enable_service_links        = false
    pod_management_policy       = "Parallel"
    publish_not_ready_addresses = true

    containers = [
      {
        name  = "kafka"
        image = var.image

        env = concat([
          {
            name = "POD_NAME"

            value_from = {
              field_ref = {
                field_path = "metadata.name"
              }
            }
          },
          {
            name  = "KAFKA_LOG_DIRS"
            value = "/data"
          },
          {
            name  = "KAFKA_ADVERTISED_LISTENERS"
            value = "PLAINTEXT://$(POD_NAME).${var.name}.${var.namespace == null ? "default" : var.namespace}.svc.cluster.local:9092"
          },
          {
            name  = "KAFKA_ZOOKEEPER_CONNECT"
            value = var.KAFKA_ZOOKEEPER_CONNECT
          },
          {
            name  = "KAFKA_LOG4J_LOGGERS"
            value = var.KAFKA_LOG4J_LOGGERS
          },
          {
            name  = "KAFKA_METRIC_REPORTERS"
            value = var.KAFKA_METRIC_REPORTERS
          },
          {
            name  = "KAFKA_CONFLUENT_METRICS_REPORTER_BOOTSTRAP_SERVERS"
            value = "${var.name}.${var.namespace}:${var.ports[0].port}"
          },
          {
            name  = "KAFKA_CONFLUENT_METRICS_REPORTER_ZOOKEEPER_CONNECT"
            value = var.KAFKA_ZOOKEEPER_CONNECT
          },
        ], var.env)

        startup_probe = {
          failure_threshold = 30
          period_seconds    = 10

          tcp_socket = {
            port = var.ports.0.port
          }
        }

        liveness_probe = {
          initial_delay_seconds = 1
          timeout_seconds       = 3

          exec = {
            command = [
              "sh",
              "-ec",
              "/usr/bin/jps | /bin/grep -q Kafka",
            ]
          }
        }

        readiness_probe = {
          tcp_socket = {
            port = var.ports.0.port
          }
        }

        volume_mounts = [
          {
            name       = var.volume_claim_template_name
            mount_path = "/data"
          }
        ]
      },
    ]

    init_containers = [
      {
        name  = "init"
        image = var.image

        command = [
          "sh",
          "-cx",
          <<-EOF
          chown -R appuser /data
          EOF
        ]

        security_context = {
          run_asuser = "0"
        }

        volume_mounts = [
          {
            name       = var.volume_claim_template_name
            mount_path = "/data"
          },
        ]
      },
    ]

    volume_claim_templates = [
      {
        name               = var.volume_claim_template_name
        storage_class_name = var.storage_class
        access_modes       = ["ReadWriteOnce"]

        resources = {
          requests = {
            storage = var.storage
          }
        }
      }
    ]
  }
}


module "statefulset-service" {
  source     = "../../../archetypes/statefulset-service"
  parameters = merge(local.parameters, var.overrides)
}
