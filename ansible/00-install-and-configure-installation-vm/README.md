# Install and Configure "Install-VM"

## Deploy a new virtual Machine "called Install-VM"

```bash

./00-install-prerequisites.sh
```



## Beschreibung

Mit diesem Playbook wird eine virtuelle Maschine vorbereitet, welche als Ausgangspunkt für die folgende Installation dient. Dies kann in Wirklichkeit ein Linux-Arbeitslaptop eines System-Engineers, oder eine Admin-VM beim Kunden sein, die später dazu verwendet wird, um die OpenShift-Installation und aller benötigten Komponenten zu steuern. 

Wir bezeichnen sie als "Puppenspieler", "Fadenzieher" oder "Ausgangspunkt".

Dieser Rechner hat zum Zeitpunkt der Einrichtung Internet-Zugang!

# Requirements
- Internet-Access
- Linux CentOS 7.7 x64_86
- 1 vCPU
- 1024 MB RAM
- 16 GB Thin provisioned disk

# Software
This software packages will be installed

- git
- ansible
- terraform + vsphere-plugin
- epel-release
- centos-release-ansible-29.noarch
- wget
- unzip