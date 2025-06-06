# Install ubuntu 18.04 on a Virtual Machine

Installation instructions for installing Ubuntu 18.04 I did whilst at Citizens Advice in 2020

Remember the installation could be tricky. We need the pre-requisites
- Oracle Virtualbox (V6 seems to have more reliability than V7!)
- Ubuntu 18.04 ISO (Latest ver)

## Manual setup
```
# Google Chrome
# Slack
# Any Language Packs / Translation Packs required
# Add Coding directory to path (~/Code)
# Download chromedriver and geckodriver AND place them on PATH
```

## Vim setup
```
sudo apt install vim -y
echo "set backspace=2" >> ~/.vimrc
echo "set nocompatible" >> ~/.vimrc
sudo update-alternatives --config editor
```

## Git setup
```
sudo apt install git -y
git config --global user.email "lukehill_uk@hotmail.com"
git config --global user.name "Luke Hill"
touch ~/.gitignore_global
echo ".idea/*" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

## Aliases
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

## Generic setup
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --no-install-recommends gnome-panel -y
sudo apt-get install build-essential gnome-tweak-tool libappindicator1 shared-mime-info software-properties-common curl perl gcc make dkms ncdu jq -y
sudo apt-get install curl perl gcc make dkms ncdu jq -y
sudo apt-get install libpq-dev libmagic-dev libcurl3-gnutls libgmp3-dev libcurl4 libcurl4-openssl-dev -y
sudo apt-get install mysql-workbench --fix-missing -y
sudo apt-get install awscli libreoffice python3-pip openjdk-8-jdk libssl1.0-dev --fix-missing -y
sudo apt install openvpn -y
sudo apt update --fix-missing
```

## Google Chrome
```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm ./google-chrome-stable_current_amd64.deb
```

## Docker
```
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo rm -rf /usr/local/bin/docker-compose
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-compose-plugin -y
apt-cache madison docker-ce
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
# Restart your machine at this point!
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock
```

## Javascript
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update
```

## Ruby
```
# Do this last because it seems to overwrite some of the other settings
# See https://github.com/rvm/rvm/issues/4915 for issues installing really old rubies
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get install rvm
source /etc/profile.d/rvm.sh
rvm fix-permissions system
rvm group add rvm $USER
rvm autolibs disable
rvm install 2.6.10 && rvm install 2.7.6 && rvm install 3.0.4 && rvm install 3.1.2 && rvm install 3.2.0
```

## Keybase
```
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
run_keybase
rm ./keybase_amd64.deb
```
