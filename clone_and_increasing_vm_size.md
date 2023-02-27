https://askubuntu.com/a/1044009/1131047

Here is the whole process, I will try to be as detailed as possible

Make sure that the machine that you are going to grow in size is in "Shutdown" state (not in "saved" or any other state)
In my case it is a 32 GB size machine and will call it the SMALL VM

Create a new Virtual Machine with the new desired size
In my case I decided to make a new a 70 GB Virtual Machine, while restoring the contents of the small machine inside this new VM and I will refer to this as the LARGE VM

BEFORE ANYTHING MAKE SURE YOU ARE ON THE HOST OS, AND YOU ARE INSIDE `C:\Program Files\Oracle\VirtualBox` (OR EQUIVALENT)

Run the command VBoxManage list hdds or Open the Virtual Media Manager to obtain the the GUID of the SMALL VM (origin) and also the GUID of the LARGE VM (destination)
With those GUIDs build the following command

`VBoxManage clonemedium SMALL_VM_GUID LARGE_VM_GUID --existing`

In my case ORIGIN - SMALL VM is: `cf7812d2-2edd-47b0-8f7c-64263b66ceb3`

In my case DESINATION - LARGE VM is: `7ec73dfa-c4f4-467a-97a3-2c33c7e0a5e5`

Of course your GUIDs are going to be different than mine

Make sure you dont invert the GUIDs otherwise the brand new machine will replace the contents of your existing machine !!!!

After making sure you did not mix origin with destination run this command:

```
$ # Note this command will take around 150-200 seconds
$ VBoxManage clonemedium cf7812d2-2edd-47b0-8f7c-64263b66ceb3 7ec73dfa-c4f4-467a-97a3-2c33c7e0a5e5 --existing

0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

Clone medium created in format 'VDI'. UUID: 7ec73dfa-c4f4-467a-97a3-2c33c7e0a5e5
```

> NB: On 27/2/23 I managed to complete this across 2 different hard disk locations (Do not try this onto a portable it will crash and burn!

```
C:\Program Files\Oracle\VirtualBox>VBoxManage clonemedium 133eb63f-6099-4e47-a077-884e3f186fdc b6c1101a-73fe-4a8c-a893-3518b4608134 --existing
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Clone medium created in format 'VDI'. UUID: b6c1101a-73fe-4a8c-a893-3518b4608134

C:\Program Files\Oracle\VirtualBox>VBoxManage list hdds
UUID:           133eb63f-6099-4e47-a077-884e3f186fdc
Parent UUID:    base
State:          created
Type:           normal (base)
Location:       C:\Users\Luke\VirtualBox VMs\Ubuntu 18.04 LTS\Ubuntu 18.04 LTS.vdi
Storage format: VDI
Capacity:       40960 MBytes
Encryption:     disabled

UUID:           b6c1101a-73fe-4a8c-a893-3518b4608134
Parent UUID:    base
State:          locked write
Type:           normal (base)
Location:       E:\Ubuntu 18.04.6\Ubuntu 18.04.6.vdi
Storage format: VDI
Capacity:       102400 MBytes
Encryption:     disabled
```

Start the new LARGE VM that you created on step 2.

Load up `gparted` from Software. Observe the new unallocated space

Reallocate the new space 100% to the existing /dev/sda1

Click Edit -> Apply all operations. This will then permanently grow your hard drive


