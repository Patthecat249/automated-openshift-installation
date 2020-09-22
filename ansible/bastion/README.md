Configuration of a Bastion Host for the Installation of a OpenShift Cluster
===============


Functions of playbooks
------
```shell
$ cat 00_playbook.yml
---
- hosts: bastion
  
  become: yes

  vars_files:
    - vars.yml

  tasks:
    - import_tasks: 01_prerequisites.yml
    - import_tasks: 02_nfs_mount.yml
    - import_tasks: 03_create_links.yml
    - import_tasks: 04_prepare_tools.yml
    - import_tasks: 05_dnsmasq_config.yml
    - import_tasks: 06_prepare_install_config.yml
    - import_tasks: 07_network_boot_config.yml
    - import_tasks: 08_manifest_ignition.yml

  handlers:
    - import_tasks: handlers.yml
```
|Playbook|functions|
|--------|---------|
|01_prerequisites.yml|Make working directories, generate ssh keys.|
|02_nfs_mount.yml|Mount NFS volume, which contains tools, tar-files etc. for later use.|
|03_create_links.yml|Link large files from NFS mount to tftp and http server accordingly to avoid big storage consumption.|
|04_prepare_tools.yml|Copy binaries `oc`, `kubectl` and `openshift-install` from NFS mount. Copy pull-secret as well.|
|05_dnsmasq_config.yml|Render `/etc/dnsmasq.conf` from template and make sure dnsmasq run properly. Add a search domain and a DNS server in `/etc/resolv.conf`|
|06_prepare_install_config.yml|Render `install-config.yaml` partially from a template. After that add pull-secret, ssh-key, certificates and image content resource. Make sure `install-config.yaml` exists in the given folder `dir_install_config`.|
|07_network_boot_config.yml|Render pxelinux.cfg-files separately for each node. Copy them and `/usr/share/syslinux/pxelinux.0` into tftp server.|
|08_manifest_ignition.yml|Generate manifests and ignition files. Prevent pods from being scheduled on master nodes. Copy ignition files into tftp server.|
> Comment out the subplaybooks if not needed. 



Usage
------------
1. Edit the file `ocp-automation/ansible/bastion/vars.yml` and commit the change in BitBucket.
2. Lauch a template in Ansible Tower. Turn to the Ansible Tower administrators for questions. But for the moment playbooks are run directly on ccisl30 with ansible 2.4. The working process may change according to situation.


Variables
--------
All variables are declaired in the file `vars.yml`, where further explaination can be found.
> Attention: Always use the `vars.yml` as a whole file. Although the variables are listed out in seperated sections, some important general ones, for example clustername, are only once defined for all sections. This warning will be removed when a future variable file structure comes into use.


Used templates
------------
- `dnsmasq.conf.j2`
  Used in `05_dnsmasq_config.yml` for rendering `/etc/dnsmasq/dnsmasq.conf`

- `install-config.yml.j2`
  Used in `06_prepare_install_config.yml` for rendering `install-config.yml`

- `pxelinux.cfg.j2`
  Used in `07_network_boot_config.yml` for rendering `pxelinux.cfg/01-<mac address>` in tftp server


Inventory
-------
No inventory file in this repo, because it is theoretically defined in Ansible Tower or in case of ccisl30 just a single `localhost`.