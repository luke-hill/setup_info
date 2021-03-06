# Install ubuntu 18.04 - Remember the installation could be tricky.

#################### Manual setup #########################
# Google Chrome
# Slack
# Any Language Packs / Translation Packs required
# Add Coding directory to path (~/Code)
# Download chromedriver and geckodriver AND place them on PATH

#################### Vim setup ############################
sudo apt install vim -y
echo "set backspace=2" >> ~/.vimrc
echo "set nocompatible" >> ~/.vimrc
sudo update-alternatives --config editor

#################### Git setup ############################
sudo apt install git -y
git config --global user.email "lukehill_uk@hotmail.com"
git config --global user.name "Luke Hill"

#################### Generic setup ########################
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --no-install-recommends gnome-panel -y
sudo apt-get install gnome-tweak-tool libappindicator1 -y
sudo apt-get install software-properties-common curl perl gcc -y
sudo apt-get install libcurl3-gnutls libcurl4-openssl-dev -y
sudo apt-get install libcurl4 jq libgmp3-dev -y
sudo apt-get install libpq-dev libmagic-dev
sudo apt-get update
sudo apt install mysql-workbench --fix-missing -y
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
sudo apt-get install awscli libreoffice --fix-missing -y
sudo apt-get install python3-pip -y
sudo apt-get install openjdk-8-jdk libssl1.0-dev --fix-missing -y
sudo apt update --fix-missing
sudo apt-get install shared-mime-info

#################### Google Chrome setup ##################
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm ./google-chrome-stable_current_amd64.deb

#################### Bash aliases setup ###################
echo "# Bash alias created as advised by ~/.bashrc" >> ~/.bash_aliases
echo "# Make a human readable path accessible at 'path' - Created on $(date)" >> ~/.bash_aliases
echo "alias path='echo \$PATH | tr \":\" \"\n\"'" >> ~/.bash_aliases
echo "# Add Timestamps to Terminal Windows - Created on $(date)" >> ~/.bash_aliases
echo "export PS1=\"[\\t] \$PS1\"" >> ~/.bash_aliases

#################### Docker setup #########################
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
apt-cache madison docker-ce
sudo docker container run hello-world
sudo apt-get update -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
# Restart your machine at this point!
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock

################### JS setup #############################
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update

################### RVM setup #############################
# Do this last because it seems to overwrite some of the other settings

sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get install rvm
source /etc/profile.d/rvm.sh
rvm autolibs disable
rvm install 2.4.10 && rvm install 2.5.8 && rvm install 2.6.6 && rvm install 2.7.2
rvm install jruby

################### Keybase setup #########################
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
run_keybase
rm ./keybase_amd64.deb
