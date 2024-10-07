# Quick-Start

```bash
# Login into INSTALLVM
ssh root@install-vm

# Set Path-Variable
mypath=${PWD}

# Clone Repository
git clone https://github.com/Patthecat249/automated-openshift-installation.git

# Install Everything (Router, Load-Balancer, Registry, Bootstrap, Master, Worker) with one command
cd $mypath/git/automated-openshift-installation/ansible/00-play-all-in-one/ && ansible-playbook 01-play-all.yaml
```





# Projektbeschreibung
This github-Project offers a fully automated OpenShift-Installation a VMware vSphere (vCenter) in an airgapped Environment. It creates and configures everything from a single point the install-vm. It is tested with Rocky-Linux 8.10 and uses a VMware Template called "rocky89-for-automated-openshift".




# How to read this Guide

Read this Guide and follow step-by-step *(Next step)* . Always follow the instructions in the README-files included in the ansible-folder. 



# Requirements
- vSphere ESXi 8.0.x + vCenter 8.0.x
- VMware Template "rocky89-for-automated-openshift" (I will create a packer automation for this template later)
- Internet-Access (only for the Install-VM)
- a free /24-Subnet-Range. I used 172.16.1.0/24 for the airgapped components
- 



# Guide
Everything starts with the creation of an **Install-VM**. This is the central Starting-Point of this guide. This **Install-VM** must be connected to the internet.



# Next step

Start reading the README in `ansible/00-install-and-configure-installation-vm` 

 