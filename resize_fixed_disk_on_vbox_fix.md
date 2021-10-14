```
# Taken from https://askubuntu.com/questions/88647/how-do-i-increase-the-hard-disk-size-of-the-virtual-machine

$ cd C:\{VM DIRECTORY}
$ VBoxManage createmedium --filename "MyNewDisk.vdi" --size 50000 --variant Fixed
$ VBoxManage clonemedium "MyOriginalDisk.vdi" "MyNewDisk.vdi" --existing
$ VBoxManage showmediuminfo "MyNewDisk.vdi"

# Change the virtual machine to use the new disk instead.
# Next, on your guest OS you need to resize the partitions to use the newly available space.
```
