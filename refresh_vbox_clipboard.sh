echo "Killing Clipboard"
pkill 'VBoxClient --clipboard' -f
sleep 1
echo "Killing all remaining VBoxClient services"
killall VBoxClient
sleep 1
echo "Restarting Clipboard - Copy and Paste Functionality"
VBoxClient --clipboard
sleep 1
echo "Restarting Clipboard - Drag and Drop Functionality"
VBoxClient --draganddrop
sleep 1
echo "Restarting all remaining VBoxClient services"
VBoxClient-all

