output "vm-name" {
 description = "VM-Name"
 value = "${vsphere_virtual_machine.vm-name.name}"
}


output "mac-address" {
 description = "Mac-Adress"
 value = "${vsphere_virtual_machine.vm-name.network_interface[0].mac_address}"
}

