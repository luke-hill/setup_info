## Install ubuntu 20.04

This is the full installation instructions I did for the new laptop for my job as
QA Lead at Ex-Ordo in January 2023

### Initial files / software
```
sudo apt-get install google-chrome-stable
sudo snap install slack
sudo apt-get install libheif-examples
sudoedit /etc/environment # Then add /home/luke/Code
```

### Vim setup
```
sudo apt-get install vim -y
echo "set backspace=2" >> ~/.vimrc
echo "set nocompatible" >> ~/.vimrc
sudo update-alternatives --config editor # Pick option 3
```

### Git setup
```
sudo apt-get install git -y
git config --global user.email "lukehill_uk@hotmail.com"
git config --global user.name "Luke Hill"
echo ".idea/*" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

### Aliases
```
echo "# Make the shell case-insensitive for autocompletions - Created on $(date)" | sudo tee -a /etc/inputrc
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
echo "# Bash alias created as advised by ~/.bashrc" >> ~/.bash_aliases
echo "# Make a human readable path accessible at 'path' - Created on $(date)" >> ~/.bash_aliases
echo "alias path='echo \$PATH | tr \":\" \"\n\"'" >> ~/.bash_aliases
echo "# Add Timestamps to Terminal Windows - Created on $(date)" >> ~/.bash_aliases
echo "export PS1=\"[\\t] \$PS1\"" >> ~/.bash_aliases
echo "# Create a docker-compose alias to provide v1 style commands - Created on $(date)" >> ~/.bash_aliases
echo 'alias docker-compose="docker compose"' >> ~/.bash_aliases
```

### Dev APT packages
```
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install --no-install-recommends gnome-panel -y
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
sudo apt-get install build-essential gnome-tweak-tool libappindicator1 shared-mime-info software-properties-common libfuse2 -y
sudo apt-get install curl dkms gcc jq make ncdu perl wget gdebi bzip2 tar -y
sudo apt-get install libpq-dev libmagic-dev libcurl3-gnutls libgmp3-dev libcurl4 libcurl4-openssl-dev -y
sudo apt-get install awscli libreoffice python3-pip openjdk-11-jdk -y
sudo apt-get install net-tools traceroute
sudo apt-get install pinta
```

### VPN
```
sudo sh -c 'echo "# OpenVPN3 Official Apt Repository for openvpn3.
deb https://swupdate.openvpn.net/community/openvpn3/repos focal main" >> /etc/apt/sources.list.d/openvpn3.list'
wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub && sudo apt-key add openvpn-repo-pkg-key.pub
rm ./openvpn-repo-pkg-key.pub
sudo apt-get update
sudo apt-get install openvpn3
```

### Docker
```
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo rm -rf /usr/local/bin/docker-compose
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
apt-cache madison docker-ce
sudo groupadd docker # Possibly redundant step in 20.04 onwards
sudo usermod -aG docker ${USER}
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R # This fails - Leaving in for now. Will remove at a later date if not needed
sudo chmod g+rwx "$HOME/.docker" -R # This fails - Leaving in for now. Will remove at a later date if not needed
# Restart your machine at this point!
sudo systemctl restart docker # Moved above as a test
sudo chmod 666 /var/run/docker.sock # Moved above as a test
```

### Javascript
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
sudo apt-get update
# Close your terminal and then re-open it
nvm install 8 && nvm install 10 && nvm install 12 # Whilst at Ex-Ordo we're using old node versions
```

### Keybase
```
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt-get install -y ./keybase_amd64.deb
run_keybase
rm ./keybase_amd64.deb
```

### Ruby
```
# Do this last because it seems to overwrite some of the other settings
# See https://github.com/rvm/rvm/issues/4915 for issues installing really old rubies
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get install rvm
source /etc/profile.d/rvm.sh
rvm fix-permissions system
rvm fix-permissions user
rvm group add rvm $USER
# Restart your machine at this point!
rvm autolibs disable
rvm install 2.6.10 && rvm install 2.7.8 && rvm install 3.0.7 && rvm install 3.1.6 && rvm install 3.2.4 && rvm install 3.3.3
```

### Cleanup
```
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y
```
