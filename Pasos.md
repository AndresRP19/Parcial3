# Parcial3

Punto 1. streama + firewall

Configuración streama

sudo -s

yum -y update

wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

yum -y localinstall jdk-8u131-linux-x64.rpm

wget https://github.com/dularion/streama/releases/download/v1.1/streama-1.1.war

mkdir /opt/streama

mv streama-1.1.war /opt/streama/streama.war

java -jar /opt/streama/streama.war

mkdir /opt/streama/media

chmod 664 /opt/streama/media

mv streama.service /etc/systemd/system/streama.service

systemctl start streama

chkconfig streama on

systemctl status streama

configuración firewall

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

Punto 3 aprovisionamiento

Scripts se encuentran subidos
