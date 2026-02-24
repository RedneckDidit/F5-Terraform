resource "bigip_ltm_virtual_server" "http" {
  name        = "/Common/vs_http"
  destination = "10.12.12.12"
  port        = 80
  pool        = "/Common/pool-1"
}
