# Install ubuntu 18.04 - Remember the installation could be tricky.

~~~~~~~~~~~~~~~~~~~~ Manual setup ~~~~~~~~~~~~~~~~~~~~~~~~~
# Google Chrome
# Slack
# Language Packs / Translation Packs
# Add Coding directory to path (~/Code)
# Download chromedriver and geckodriver AND place them on PATH

~~~~~~~~~~~~~~~~~~~~ Vim setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "set backspace=2" >> ~/.vimrc
echo "set nocompatible" >> ~/.vimrc

~~~~~~~~~~~~~~~~~~~~ GFX setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
# Ignore the italicised writing below, thats VI being stupid!!
sudo apt-get purge '*nvidia*'
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update

~~~~~~~~~~~~~~~~~~~~ Generic setup ~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --no-install-recommends gnome-panel
sudo apt-get install gnome-tweak-tool libappindicator1
sudo apt install git
sudo apt-get install software-properties-common
sudo apt-get install curl
sudo apt-get install libcurl3-gnutls libcurl4-openssl-dev
sudo apt-get install libcurl4
sudo apt install vim
sudo apt-get update
sudo apt install mysql-workbench
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
sudo apt-get install awscli libreoffice pip
sudo apt-get install openjdk-8-jdk libssl1.0-dev
sudo apt update
sudo npm install speccy -g
~~~~~~~~~~~~~~~~~~~~ Bash aliases setup ~~~~~~~~~~~~~~~~~~~
echo "# Bash alias created as advised by ~/.bashrc" >> ~/.bash_aliases
echo "# Make a human readable path accessible at 'path' - Created on $(date)" >> ~/.bash_aliases
echo "alias path='echo \$PATH | tr \":\" \"\n\"'" >> ~/.bash_aliases
echo "# Add Timestamps to Terminal Windows - Created on $(date)" >> ~/.bash_aliases
echo "export PS1=\"[\\t] \$PS1\"" >> ~/.bash_aliases

~~~~~~~~~~~~~~~~~~~~ Docker setup ~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
apt-cache madison docker-ce
sudo docker container run hello-world
sudo apt-get update
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

~~~~~~~~~~~~~~~~~~~~ NVM setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# sudo apt-get install nodejs-dev node-gyp - This is unlikely to be required
# sudo apt-get install npm mocha - This is unlikely to be useful yet
sudo apt update

~~~~~~~~~~~~~~~~~~~~ RVM setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Do this last because it seems to overwrite some of the other settings

sudo apt-add-repository -y ppa:rael-gc/rvm
source /etc/profile.d/rvm.sh
sudo apt-get install rvm
rvm autolibs disable
rvm install 2.3
rvm install 2.4
rvm install 2.5
rvm install 2.6
rvm install 2.7
rvm install jruby

