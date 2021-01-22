locals {
  labels = lookup(var.parameters, "labels", {
    app     = var.parameters.name
    name    = var.parameters.name
    service = var.parameters.name
  })

  selector = {
    match_labels = local.labels
  }

  k8s_apps_v1_daemon_set_parameters = merge({ labels = local.labels, selector = local.selector }, var.parameters)
}
