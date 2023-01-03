echo "Attempting a full clearance of daemon clipboard processes"
VBOX_RELEASE_LOG_DEST=file VBOX_RELEASE_LOG=all.e.l.l2.f VBoxClient --clipboard --nodaemon
sleep 0.5
echo "Killing Clipboard"
pkill 'VBoxClient --clipboard' -f
sleep 0.5
echo "Killing all remaining VBoxClient services"
killall VBoxClient
sleep 0.5
echo "Restarting Clipboard - Copy and Paste Functionality"
VBoxClient --clipboard
sleep 0.5
echo "Restarting Clipboard - Drag and Drop Functionality"
VBoxClient --draganddrop
sleep 0.5
echo "All Clipboard functionality should now be refreshed"
