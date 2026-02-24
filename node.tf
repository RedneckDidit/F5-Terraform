resource "bigip_ltm_node" "node1" {
  name             = "/Common/node1"
  address          = "192.168.30.1"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}
resource "bigip_ltm_node" "node2" {
  name             = "/Common/node2"
  address          = "192.168.30.2"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}
resource "bigip_ltm_node" "node3" {
  name             = "/Common/node3"
  address          = "192.168.30.3"
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = "/Common/icmp"
  description      = "Test-Node"
  rate_limit       = "disabled"
}
