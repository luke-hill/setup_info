```
$ wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
$ sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
# Select the correct version and Ubuntu version
$ sudo apt update
# If key-error occurs then run following command
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
$ sudo apt-cache policy mysql-server
# Replace the VER value below with the value desired
$ sudo apt install -f mysql-client=VER* mysql-community-server=VER* mysql-server=VER*
$ sudo apt-get install libmariadb-dev libmysqlclient-dev
```
