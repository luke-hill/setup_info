echo "Killing Clipboard"
pkill 'VBoxClient --clipboard' -f
sleep 1
echo "Restarting Clipboard - Copy and Paste Functionality"
VBoxClient --clipboard
sleep 1
echo "Restarting Clipboard - Drag and Drop Functionality"
VBoxClient --draganddrop
sleep 1
