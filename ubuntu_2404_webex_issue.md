## Fix Ubuntu 24.04 Webex problem (Screen sharing)

The issue with Ubuntu 22.04 is that it now uses a display feature called wayland by default, while in versions prior to 21.04 Ubuntu defaulted to using xorg as its display server. Wayland does not support screen sharing by default (until now, at least!).

To check which display system your Ubuntu is using, please enter this command

`echo $XDG_SESSION_TYPE`
If the above command outputs wayland, your system is using wayland.

In order to use screen sharing, we have to disable wayland and enable xorg (x11). To do this, Please go to this file

`sudo vi /etc/gdm3/custom.conf`
Uncomment this line.

`WaylandEnable=false`


Reboot your system.

Voila! You can share your screen. You can confirm this by re-entering this command.

`echo $XDG_SESSION_TYPE`
Now it should display x11.

If x11 is not shown yet, run the command below:

`sudo systemctl restart gdm`
