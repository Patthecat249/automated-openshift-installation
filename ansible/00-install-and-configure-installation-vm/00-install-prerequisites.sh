mypath=$(pwd)
yum install epel-release -y
yum install centos-release-ansible-29.noarch -y
yum install ansible -y
yum install wget -y
yum install git -y
yum install unzip -y
yum install sshpass -y
yum install jq -y
cd $mypath
wget https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip
unzip terraform_0.14.2_linux_amd64.zip
cp terraform /usr/local/bin/terraform
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa
sshpass -f rootpassword ssh-copy-id -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no root@localhost
ansible all -i localhost, -m user -a "name=pi group=wheel password={{'Test1234' | password_hash('sha512', '')}} generate_ssh_key=yes ssh_key_bits=2048 ssh_key_file=.ssh/id_rsa"
mypath=/home/pi
# Clone Github-Repository and Type Credentials
mkdir $mypath/git && cd $mypath/git && git config --global credential.helper store && git clone https://github.com/Patthecat249/automated-openshift-installation.git
chown -R pi:wheel /home/pi/git
mkdir /opt/sva
chgrp wheel /opt/sva
chmod 775 /opt/sva
echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/wheel
su - pi
# ssh-copy-id -o StrictHostKeyChecking=no pi@pi