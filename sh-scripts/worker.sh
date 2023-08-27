sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
echo "15############################################################"
sudo apt update
sudo apt install python ansible -y
sudo apt-get install acl
echo "30############################################################"
sudo useradd -m -s /bin/bash ansible
sudo passwd ansible -d
sudo mkdir /home/ansible/.ssh
echo "45############################################################"
sudo chown ansible:ansible /home/ansible/.ssh
sudo -u ansible ssh-keygen -f /home/ansible/.ssh/id_rsa -t rsa -N ''
sudo useradd -m -s /bin/bash kube-cluster
echo "60############################################################"
sudo passwd kube-cluster -d
sudo sed -i '20a kube-cluster  ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
sudo sed -i '20a ansible  ALL=(ALL:ALL) NOPASSWD: ALL' /etc/sudoers
echo "75############################################################"
sudo touch /home/ansible/.ssh/authorized_keys
sudo echo "" >> /home/ansible/.ssh/authorized_keys #addkey from master
sudo chown ansible:ansible /home/ansible/.ssh/authorized_keys
echo "90############################################################"
sudo chmod 600 /home/ansible/.ssh/authorized_keys
sudo cat /home/ansible/.ssh/id_rsa.pub
echo "100############################################################"

 