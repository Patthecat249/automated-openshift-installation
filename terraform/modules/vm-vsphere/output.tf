output "vm-name" {
 description = "VM-Name"
 value = vsphere_virtual_machine.default.name
}


output "mac-address" {
 description = "Mac-Adress"
 value = vsphere_virtual_machine.default.network_interface[0].mac_address
}

