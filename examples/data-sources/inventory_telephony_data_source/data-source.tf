terraform {
  required_providers {
    dcloud = {
      version = "0.1"
      source  = "cisco-open/dcloud"
    }
  }
}

provider "dcloud" {
  tb_url = "https://tbv3-production.ciscodcloud.com/api"
}

resource "dcloud_topology" "test_topology" {
  name        = "Test Topology For Testing Inventory Telephony Items"
  description = "Will be used to load inventory telephony items"
  notes       = ""
  datacenter  = "LON"
}

data "dcloud_inventory_telephony" "topology1_inventory_telephony" {
  topology_uid = dcloud_topology.test_topology.id
}

output "telephony-items" {
  value = data.dcloud_inventory_telephony.topology1_inventory_telephony
}