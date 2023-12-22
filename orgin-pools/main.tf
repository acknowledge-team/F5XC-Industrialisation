resource "volterra_origin_pool" "origin-pool" {
  port                   = var.f5xc_origin_pool_port
  name                   = var.f5xc_origin_pool_name
  no_tls                 = var.f5xc_origin_pool_no_tls
  namespace              = var.f5xc_namespace
  health_check_port      = var.f5xc_origin_pool_health_check_port != "" ? var.f5xc_origin_pool_health_check_port : null
  endpoint_selection     = var.f5xc_origin_pool_endpoint_selection
  same_as_endpoint_port  = var.f5xc_origin_pool_same_as_endpoint_port
  loadbalancer_algorithm = var.f5xc_origin_pool_loadbalancer_algorithm

  dynamic "healthcheck" {
    for_each = var.f5xc_origin_pool_healthcheck_names
    content {
      name = healthcheck.value
    }
  }
