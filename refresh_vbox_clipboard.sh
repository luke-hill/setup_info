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
