service NetworkManager stop
chkconfig NetworkManager off
service firewalld start
chkconfig firewalld on
sudo firewall-cmd --set-default-zone=dmz
sudo firewall-cmd --zone=dmz --add-interface=eth2 –-permanent
sudo firewall-cmd --zone=dmz --remove-interface=eth1 –-permanent
firewall-cmd --zone=dmz --add-service=http --permanent
firewall-cmd --zone=internal --add-interface=eth2 --permanent
sudo firewall-cmd --zone=dmz --add-masquerade --permanent
sudo firewall-cmd --zone=internal --add-masquerade --permanent

firewall-cmd --zone="dmz"--add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.3 --permanent
firewall-cmd --zone="dmz"--add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.3 --permanent
firewall-cmd --reload