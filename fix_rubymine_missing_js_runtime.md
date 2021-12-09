# Fix RubyMine missing JS runtime

From https://sinaru.com/2020/09/04/fixing-missing-nvm-node-for-rubymine/

```
$ sudo vi /etc/profile.d/nvm.sh

# Then copy the following code into it

if [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
```
Then add the following lane to your .bashrc

```
source "/etc/profile.d/nvm.sh"
```
