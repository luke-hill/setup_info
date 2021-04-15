# Taken from https://superuser.com/questions/1130898/no-internet-connection-inside-docker-containers

sudo apt install net-tools bridge-utils
sudo pkill docker
sudo iptables -t nat -F
sudo ifconfig docker0 down
sudo brctl delbr docker0
systemctl stop docker
docker -d

