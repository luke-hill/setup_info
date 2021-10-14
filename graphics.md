### GFX setup
```
ubuntu-drivers devices
# sudo ubuntu-drivers autoinstall - This I think causes issues
echo "This will look like it's wiping files. But don't worry it won't screw with C+P"
sudo apt-get purge '*nvidia*'
sudo add-apt-repository ppa:graphics-drivers -y
sudo apt-get update
```
