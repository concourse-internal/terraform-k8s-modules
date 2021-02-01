resource "k8s_rbac_authorization_k8s_io_v1beta1_cluster_role_binding" "nginx_ingress_clusterrole_nisa_binding" {
  metadata {
    labels = {
      "app.kubernetes.io/name"    = var.name
      "app.kubernetes.io/part-of" = var.name
    }
    name = "${var.namespace}:${var.name}"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "${var.namespace}:${var.name}"
  }

  subjects {
    kind      = "ServiceAccount"
    name      = var.name
    namespace = var.namespace
  }
}