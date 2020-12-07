
# VMware Folder, where VM will be created
variable "ocp-folder" {
  default = "{{ dir_vmware }}"
}

# VMware Tag
variable "master_guest_id_tag" {
  default = "centos8_64Guest"
}

