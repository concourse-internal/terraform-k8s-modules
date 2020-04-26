resource "k8s_config_istio_io_v1alpha2_attributemanifest" "istioproxy" {
  metadata {
    labels = {
      "app"      = "mixer"
      "chart"    = "mixer"
      "heritage" = "Tiller"
      "release"  = "istio"
    }
    name      = "istioproxy"
    namespace = var.namespace
  }
  spec = <<-JSON
    {
      "attributes": {
        "api.operation": {
          "valueType": "STRING"
        },
        "api.protocol": {
          "valueType": "STRING"
        },
        "api.service": {
          "valueType": "STRING"
        },
        "api.version": {
          "valueType": "STRING"
        },
        "check.cache_hit": {
          "valueType": "BOOL"
        },
        "check.error_code": {
          "valueType": "INT64"
        },
        "check.error_message": {
          "valueType": "STRING"
        },
        "connection.duration": {
          "valueType": "DURATION"
        },
        "connection.event": {
          "valueType": "STRING"
        },
        "connection.id": {
          "valueType": "STRING"
        },
        "connection.mtls": {
          "valueType": "BOOL"
        },
        "connection.received.bytes": {
          "valueType": "INT64"
        },
        "connection.received.bytes_total": {
          "valueType": "INT64"
        },
        "connection.requested_server_name": {
          "valueType": "STRING"
        },
        "connection.sent.bytes": {
          "valueType": "INT64"
        },
        "connection.sent.bytes_total": {
          "valueType": "INT64"
        },
        "context.protocol": {
          "valueType": "STRING"
        },
        "context.proxy_error_code": {
          "valueType": "STRING"
        },
        "context.proxy_version": {
          "valueType": "STRING"
        },
        "context.reporter.kind": {
          "valueType": "STRING"
        },
        "context.reporter.local": {
          "valueType": "BOOL"
        },
        "context.reporter.uid": {
          "valueType": "STRING"
        },
        "context.time": {
          "valueType": "TIMESTAMP"
        },
        "context.timestamp": {
          "valueType": "TIMESTAMP"
        },
        "destination.port": {
          "valueType": "INT64"
        },
        "destination.principal": {
          "valueType": "STRING"
        },
        "destination.uid": {
          "valueType": "STRING"
        },
        "origin.ip": {
          "valueType": "IP_ADDRESS"
        },
        "origin.uid": {
          "valueType": "STRING"
        },
        "origin.user": {
          "valueType": "STRING"
        },
        "quota.cache_hit": {
          "valueType": "BOOL"
        },
        "rbac.permissive.effective_policy_id": {
          "valueType": "STRING"
        },
        "rbac.permissive.response_code": {
          "valueType": "STRING"
        },
        "request.api_key": {
          "valueType": "STRING"
        },
        "request.auth.audiences": {
          "valueType": "STRING"
        },
        "request.auth.claims": {
          "valueType": "STRING_MAP"
        },
        "request.auth.presenter": {
          "valueType": "STRING"
        },
        "request.auth.principal": {
          "valueType": "STRING"
        },
        "request.auth.raw_claims": {
          "valueType": "STRING"
        },
        "request.headers": {
          "valueType": "STRING_MAP"
        },
        "request.host": {
          "valueType": "STRING"
        },
        "request.id": {
          "valueType": "STRING"
        },
        "request.method": {
          "valueType": "STRING"
        },
        "request.path": {
          "valueType": "STRING"
        },
        "request.query_params": {
          "valueType": "STRING_MAP"
        },
        "request.reason": {
          "valueType": "STRING"
        },
        "request.referer": {
          "valueType": "STRING"
        },
        "request.scheme": {
          "valueType": "STRING"
        },
        "request.size": {
          "valueType": "INT64"
        },
        "request.time": {
          "valueType": "TIMESTAMP"
        },
        "request.total_size": {
          "valueType": "INT64"
        },
        "request.url_path": {
          "valueType": "STRING"
        },
        "request.useragent": {
          "valueType": "STRING"
        },
        "response.code": {
          "valueType": "INT64"
        },
        "response.duration": {
          "valueType": "DURATION"
        },
        "response.grpc_message": {
          "valueType": "STRING"
        },
        "response.grpc_status": {
          "valueType": "STRING"
        },
        "response.headers": {
          "valueType": "STRING_MAP"
        },
        "response.size": {
          "valueType": "INT64"
        },
        "response.time": {
          "valueType": "TIMESTAMP"
        },
        "response.total_size": {
          "valueType": "INT64"
        },
        "source.principal": {
          "valueType": "STRING"
        },
        "source.uid": {
          "valueType": "STRING"
        },
        "source.user": {
          "valueType": "STRING"
        }
      }
    }
    JSON
}