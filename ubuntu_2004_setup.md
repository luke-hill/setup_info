## Install ubuntu 20.04

This is the full installation instructions I did for the new laptop for my job as
QA Lead at Ex-Ordo

### Initial files / software
```
# sudo apt-get install google-chrome-stable
# sudo snap install slack
# sudoedit /etc/environment # Then add /home/luke/Code
```

### Vim setup
```
sudo apt install vim -y
echo "set backspace=2" >> ~/.vimrc
echo "set nocompatible" >> ~/.vimrc
sudo update-alternatives --config editor
```

### Git setup
```
sudo apt install git -y
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

### Generic setup
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --no-install-recommends gnome-panel -y
sudo apt-get install build-essential gnome-tweak-tool libappindicator1 shared-mime-info software-properties-common curl perl gcc make dkms ncdu jq -y
sudo apt-get install libpq-dev libmagic-dev libcurl3-gnutls libgmp3-dev libcurl4 libcurl4-openssl-dev -y
sudo apt-get install awscli libreoffice python3-pip openjdk-8-jdk -y
sudo apt-get install openvpn -y
```

### Docker
```
TBC - Use 18.04 as a base
```

### Javascript
```
TBC - Use 18.04 as a base
```

### Keybase
```
TBC - Use 18.04 as a base
```

### Ruby
```
# Do this last because it seems to overwrite some of the other settings
TBC - Use 18.04 as a base
```