# Install ubuntu 24.04

**DEPRECATED**

> This "was" the full installation instructions I did for the new laptop for my job as
QA Lead at Dexters in 2024

**NOW**

> Use the [Ubuntu 22.04 setup](./ubuntu_2204_setup.md) guide instead. As the 24.04 guide is
still quite flaky and doesn't work well with Dell machines

## Vim setup
```
sudo apt-get install vim -y
echo "set backspace=2" >> ~/.vimrc
echo "set nocompatible" >> ~/.vimrc
sudo update-alternatives --config editor # Pick option 3
```

## Initial files / software
```
sudo apt-get install google-chrome-stable
sudo snap install slack
sudo apt-get install libheif-examples
sudoedit /etc/environment # Then add /home/luke/Code
```

## Git setup
```
sudo apt-get install git -y
git config --global user.email "lukehill_uk@hotmail.com"
git config --global user.name "Luke Hill"
echo ".idea/*" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

## Aliases
```
echo "# Make the shell case-insensitive for autocompletions - Created on $(date)" | sudo tee -a /etc/inputrc
echo set completion-ignore-case on | sudo tee -a /etc/inputrc
echo "# Bash aliases created as advised by ~/.bashrc" >> ~/.bash_aliases
echo "# Make a human readable path accessible at 'path' - Created on $(date)" >> ~/.bash_aliases
echo "alias path='echo \$PATH | tr \":\" \"\n\"'" >> ~/.bash_aliases
echo "# Add Timestamps to Terminal Windows - Created on $(date)" >> ~/.bash_aliases
echo "export PS1=\"[\\t] \$PS1\"" >> ~/.bash_aliases
echo "# Create a docker-compose alias to provide v1 style commands - Created on $(date)" >> ~/.bash_aliases
echo 'alias docker-compose="docker compose"' >> ~/.bash_aliases
```

## Dev APT packages
```
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install --no-install-recommends gnome-panel gnome-tweak-tool -y
sudo apt-get install apt-transport-https ca-certificates software-properties-common build-essential libappindicator3.1 shared-mime-info libfuse2 -y
sudo apt-get install curl dkms gcc jq make ncdu perl wget gdebi bzip2 tar -y
sudo apt-get install libpq-dev libmagic-dev libcurl3-gnutls libgmp3-dev libcurl4 libcurl4-openssl-dev -y
sudo apt-get install libreoffice python3-pip openjdk-21-jdk net-tools traceroute mtpaint -y
```

## VPN
```
sudo sh -c 'echo "# OpenVPN3 Official Apt Repository for openvpn3.
deb https://swupdate.openvpn.net/community/openvpn3/repos focal main" >> /etc/apt/sources.list.d/openvpn3.list'
wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub && sudo apt-key add openvpn-repo-pkg-key.pub
rm ./openvpn-repo-pkg-key.pub
sudo apt-get update
sudo apt-get install openvpn3
```

## Docker
```
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker ${USER}
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock
```

## Javascript
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
sudo apt-get update
# Close your terminal and then re-open it
nvm install 14 && nvm install 16 && nvm install 18 && nvm install 20 && nvm install 22
```

## Keybase
```
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt-get install -y ./keybase_amd64.deb
run_keybase
rm ./keybase_amd64.deb
```

## Ruby
```
# Do this last because it seems to overwrite some of the other settings
# Keep monitoring https://github.com/rvm/rvm/issues/4915 for tips installing any 2.x ruby
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get install rvm
source /etc/profile.d/rvm.sh
rvm fix-permissions system
rvm fix-permissions user
rvm group add rvm $USER
# Restart your machine at this point!
rvm autolibs disable
rvm install 3.1.6 && rvm install 3.2.6 && rvm install 3.3.6
```

## RubyMine fixes
```
# Whilst RubyMine 2024 has issues with debugging and ruby 3.1+
$ sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```

## Cleanup
```
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y
```
