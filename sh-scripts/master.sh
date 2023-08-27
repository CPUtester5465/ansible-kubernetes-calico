sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt update 
sudo apt install python ansible -y
sudo apt-get install acl -y

sudo useradd -m -s /bin/bash kube-cluster
sudo passwd kube-cluster -d
sudo sed -i '20a kube-cluster  ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
sudo useradd -m -s /bin/bash ansible-control-panel
sudo passwd ansible-control-panel -d
sudo sed -i '20a ansible-control-panel ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
sudo mkdir /home/ansible-control-panel/.ssh
sudo chown -R ansible-control-panel:ansible-control-panel /home/ansible-control-panel/.ssh/
sudo mkdir /home/ansible-control-panel/ansible
sudo chown -R ansible-control-panel:ansible-control-panel /home/ansible-control-panel/ansible/
sudo -u ansible-control-panel ssh-keygen -f /home/ansible-control-panel/.ssh/id_rsa -t rsa -N ''
sudo cat /home/ansible-control-panel/.ssh/id_rsa.pub #copy id_rsa
#add to authorized_keys in ubuntu in master add linux/windows pub keys (better with ansible)
#echo "ansible-control-panel:new_password" | sudo chpasswd #if its necessary
