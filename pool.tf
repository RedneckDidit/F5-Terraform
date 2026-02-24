resource "bigip_ltm_monitor" "monitor" {
  name   = "/Common/terraform_monitor"
  parent = "/Common/http"
}

resource "bigip_ltm_pool" "pool" {
  name                   = "/Common/pool-1"
  load_balancing_mode    = "round-robin"
  minimum_active_members = 1
  monitors               = [bigip_ltm_monitor.monitor.name]
}
