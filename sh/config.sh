echo "Do you want to install openssh-server?"
read x
if [[ "${x}" = "yes" ]]
then
sudo apt-get update
sudo apt-get install openssh-server

sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow 2222
sudo ufw enable

touch ~/.ssh/authorized_keys																														
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC+MW/EmeoZuFV/asis1OgYk7Y4hd8h9nBApWsbNhnd+GKYS0tkzYdsLS9d3vGEApG9Txthirm8gTmtUBFEv5PdIQQdkkNOsqSuzcKCXqUVGM+ninv6bK7AjdWuqUd0FQ7QT74fRl1O7V9R6uXeuXdYeaPCBKH/OIxBswbwx5Eptw== computer@computer-desktop" > ~/.ssh/authorized_keys
echo "finished installation..."