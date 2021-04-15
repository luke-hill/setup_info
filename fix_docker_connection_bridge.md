# Taken from https://superuser.com/questions/1130898/no-internet-connection-inside-docker-containers

pkill docker
iptables -t nat -F
ifconfig docker0 down
brctl delbr docker0
docker -d

