provider "vsphere" {
  vsphere_server = var.vsphere_server
  user = var.vsphere_user
  password = var.vsphere_pass
  allow_unverified_ssl = true
}

variable "esxi_hosts" {
  default = [
    "esx01.home.local",
    "esx02.home.local"
  ]
}

variable "network_interfaces" {
  default = [
#    "vmnic0",
#    "vmnic1",
#    "vmnic2",
    "vmnic3"
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

# Create/Deploy a Distributed Virtual Switch
resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "vds-openshift"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Deploy a Distributed Port Group on the Distributed Virtual Switch created above
resource "vsphere_distributed_port_group" "pg" {
  name                            = "dpg-openshift"
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.dvs.id
  number_of_ports = 8
  vlan_id = 20
}
