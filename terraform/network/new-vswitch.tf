variable "esxi_hosts" {
  default = [
    "esx01",
    "esx02"
  ]
}

variable "network_interfaces" {
  default = [
    "vmnic0",
    "vmnic1",
    "vmnic2",
    "vmnic3",
  ]
}

data "vsphere_datacenter" "dc" {
  name = "dc-home"
}

data "vsphere_host" "host" {
  count         = "${length(var.esxi_hosts)}"
  name          = "${var.esxi_hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "terraform-test-dvs"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"

  #uplinks         = ["uplink1", "uplink2", "uplink3", "uplink4"]
  #active_uplinks  = ["uplink1", "uplink2"]
  #standby_uplinks = ["uplink3", "uplink4"]

  host {
    host_system_id = "${data.vsphere_host.host.0.id}"
    devices        = ["${var.network_interfaces}"]
  }

  host {
    host_system_id = "${data.vsphere_host.host.1.id}"
    devices        = ["${var.network_interfaces}"]
  }

}