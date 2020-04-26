resource "k8s_config_istio_io_v1alpha2_instance" "tcpbytereceived" {
  metadata {
    labels = {
      "app"      = "mixer"
      "chart"    = "mixer"
      "heritage" = "Tiller"
      "release"  = "istio"
    }
    name      = "tcpbytereceived"
    namespace = var.namespace
  }
  spec = <<-JSON
    {
      "compiledTemplate": "metric",
      "params": {
        "dimensions": {
          "connection_security_policy": "conditional((context.reporter.kind | \"inbound\") == \"outbound\", \"unknown\", conditional(connection.mtls | false, \"mutual_tls\", \"none\"))",
          "destination_app": "destination.labels[\"app\"] | \"unknown\"",
          "destination_principal": "destination.principal | \"unknown\"",
          "destination_service": "destination.service.host | \"unknown\"",
          "destination_service_name": "destination.service.name | \"unknown\"",
          "destination_service_namespace": "destination.service.namespace | \"unknown\"",
          "destination_version": "destination.labels[\"version\"] | \"unknown\"",
          "destination_workload": "destination.workload.name | \"unknown\"",
          "destination_workload_namespace": "destination.workload.namespace | \"unknown\"",
          "reporter": "conditional((context.reporter.kind | \"inbound\") == \"outbound\", \"source\", \"destination\")",
          "response_flags": "context.proxy_error_code | \"-\"",
          "source_app": "source.labels[\"app\"] | \"unknown\"",
          "source_principal": "source.principal | \"unknown\"",
          "source_version": "source.labels[\"version\"] | \"unknown\"",
          "source_workload": "source.workload.name | \"unknown\"",
          "source_workload_namespace": "source.workload.namespace | \"unknown\""
        },
        "monitored_resource_type": "\"UNSPECIFIED\"",
        "value": "connection.received.bytes | 0"
      }
    }
    JSON
}