# Install brew from http://brew.sh/
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew doctor
$ softwareupdate --all --install --force
$ sudo xcode-select --install
$ brew update
$ brew upgrade
$ brew install git
$ git --version # This should output a number
$ curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
# Quit the terminal once this has installed, and restart your machine
$ type rvm | head -1
$ rvm -v # This should output a number
# Install rubies 2.5/2.6/2.7/3.0
$ rvm install 2.5.9
$ rvm install 2.6.8
$ rvm install 2.7.4
$ rvm install 3.0.2
# The fix below is to remedy an Issue on Big Sur
# See https://github.com/rvm/rvm/issues/5047#issuecomment-844985557
export warnflags=-Wno-error=implicit-function-declaration
$ softwareupdate --install-rosetta

