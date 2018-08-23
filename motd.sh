# 2018 dnomaid.co.uk
# Put contents in a file in /etc/profile.d to autorun on login

# Escape code
esc=`echo -en "\033"`

# Set colors
esc=`echo -en "\033"`
a="${esc}[;96m"
b="${esc}[;94m"
c="${esc}[;34m"
N=`echo -en "${esc}[m\017"`

loadAvg1=$(cat /proc/loadavg | cut -d ' ' -f 1)
loadAvg5=$(cat /proc/loadavg | cut -d ' ' -f 2)
loadAvg15=$(cat /proc/loadavg | cut -d ' ' -f 3)
raidUsed=$(df -lh | grep -oP '[0-9][0-9]%' | tail -n 1)
ssdUsed=$(df -lh | grep -oP '[0-9][0-9]%' | head -n 1)

clear

echo "${a}  __ _     _                         ";
echo " / _(_)   | |                        ";
echo "| |_ _ ___| |__  _   _               ";
echo "|  _| / __| '_ \| | | |              ";
echo "| | | \__ \ | | | |_| |              ";
echo "|_| |_|___/_| |_|\__, |              ";
echo "                  __/ |              ";
echo "                 |___/               ";
echo "${b}                 _ _             _   ";
echo "                | (_)           | |  ";
echo " _ __  _ __ ___ | |_  __ _ _ __ | |_ ";
echo "| '_ \| '__/ _ \| | |/ _\` | '_ \| __|";
echo "| |_) | | | (_) | | | (_| | | | | |_ ";
echo "| .__/|_|  \___/|_|_|\__,_|_| |_|\__|";
echo "| |                                  ";
echo "|_|                                  ";

echo ""
echo "${a}LAST LOGINS${b}"
last | head -n 5
echo "${c}$(uptime -p)"

echo ""
echo "${a}    LOAD AVG         DISK USAGE     RUNNING LXC"
echo "${b}$loadAvg1  $loadAvg5  $loadAvg15     $raidUsed    $ssdUsed     $(lxc-ls)"
echo "${c} 1m    5m   15m      RAID   SSD     "

echo ''
echo $N
