terraform {
  required_providers {
    bigip = {
      source = "terraform-providers/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.hostname
  username = var.username
  password = var.password
}

resource "bigip_ltm_node" "node1" {
  name             = "/Common/node1"
  address          = "192.168.30.1"
}
resource "bigip_ltm_node" "node2" {
  name             = "/Common/node2"
  address          = "192.168.30.2"
}
resource "bigip_ltm_node" "node3" {
  name             = "/Common/node3"
  address          = "192.168.30.3"
}

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

resource "bigip_ltm_pool_attachment" "ipv4_node_attach" {
for_each = toset([bigip_ltm_node.node1.name, bigip_ltm_node.node2.name,bigip_ltm_node.node3.name])
  pool = bigip_ltm_pool.pool.name
  node = "${each.key}:80"
}


resource "bigip_ltm_virtual_server" "http" {
  name        = "/Common/vs_http"
  destination = "10.12.12.12"
  port        = 80
  pool        = "/Common/pool-1"
}
