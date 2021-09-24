https://askubuntu.com/a/1044009/1131047

Here is the whole process, I will try to be as detailed as possible

Make sure that the machine that you are going to grow in size is in "Shutdown" state (not in "saved" or any other state)
In my case it is a 32 GB size machine and will call it the SMALL VM

Create a new Virtual Machine with the new desired size
In my case I decided to make a new a 70 GB Virtual Machine, while restoring the contents of the small machine inside this new VM and I will refer to this as the LARGE VM

BEFORE ANYTHING MAKE SURE YOU ARE ON THE HOST OS, AND YOU ARE INSIDE C:\Program Files\Oracle\VirtualBox (OR EQUIVALENT)

Run the command VBoxManage list hdds or Open the Virtual Media Manager to obtain the the GUID of the SMALL VM (origin) and also the GUID of the LARGE VM (destination)
With those GUIDs build the following command

VBoxManage clonemedium SMALL_VM_GUID LARGE_VM_GUID --existing

In my case ORIGIN - SMALL VM is: cf7812d2-2edd-47b0-8f7c-64263b66ceb3

In my case DESINATION - LARGE VM is: 7ec73dfa-c4f4-467a-97a3-2c33c7e0a5e5

Of course your GUIDs are going to be different than mine

Make sure you dont invert the GUIDs otherwise the brand new machine will replace the contents of your existing machine !!!!

After making sure you did not mix origin with destination run this command:

$ # Note this command will take around 150-200 seconds
$ VBoxManage clonemedium cf7812d2-2edd-47b0-8f7c-64263b66ceb3 7ec73dfa-c4f4-467a-97a3-2c33c7e0a5e5 --existing

0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

Clone medium created in format 'VDI'. UUID: 7ec73dfa-c4f4-467a-97a3-2c33c7e0a5e5

Start the new LARGE VM that you created on step 2.

Check in the Computer Managment window tool that the machine has in fact more size unused/unformat space

Using the gparted-live*.iso, "insert it" into the new virtual machine and reboot it

Boot into the gparted environment & Grow your partition and save changes

