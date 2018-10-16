# 2018 dnomaid.co.uk
# Put contents in a file in /etc/profile.d to autorun on login

# Escape code
esc=`echo -en "\033"`

# Set colors
esc=`echo -en "\033"`
a="${esc}[;96m"
b="${esc}[;97m"
c="${esc}[;90m"
RED="${esc}[;91m"
YEL="${esc}[;93m"
GRE="${esc}[;92m"
N=`echo -en "${esc}[m\017"`

loadAvg1=$(cat /proc/loadavg | cut -d ' ' -f 1)
#loadAvg1=$(echo "$loadAvg1a * 1" | bc -l)
loadAvg5=$(cat /proc/loadavg | cut -d ' ' -f 2)
#loadAvg5=$(echo "$loadAvg5a * 1" | bc -l)
loadAvg15=$(cat /proc/loadavg | cut -d ' ' -f 3)
#loadAvg15=$(echo "$loadAvg15a * 1" | bc -l)

raidUsed=$(df -lh | grep -oP '[0-9][0-9]%' | tail -n 1)
ssdUsed=$(df -lh | grep -oP '[0-9][0-9]%' | head -n 1)

disk1=$(node /root/MOTD-DISK-STATS/index.js 1)
disk2=$(node /root/MOTD-DISK-STATS/index.js 2)
raidS=$(node /root/MOTD-DISK-STATS/index.js r)

clear

echo "${a}______ _     _           ${b} ______          _ _             _   ";
echo "${a}|  ___(_)   | |          ${b} | ___ \        | (_)           | |  ";
echo "${a}| |_   _ ___| |__  _   _ ${b} | |_/ / __ ___ | |_  __ _ _ __ | |_ ";
echo "${a}|  _| | / __| '_ \| | | |${b} |  __/ '__/ _ \| | |/ _\` | '_ \| __|";
echo "${a}| |   | \__ \ | | | |_| |${b} | |  | | | (_) | | | (_| | | | | |_ ";
echo "${a}\_|   |_|___/_| |_|\__, |${b} \_|  |_|  \___/|_|_|\__,_|_| |_|\__|";
echo "${a}                    __/ |${b}                                     ";
echo "${a}                   |___/ ${b}                                     ";

echo ""
echo "${a}LAST LOGINS"
echo "${b}$(last | head -n 5)"
echo "${c}$(uptime -p)"

echo ""
echo "${a}    LOAD AVG       DISK USE   DISK STATS   RUNNING LXC"
echo "${b}$loadAvg1  $loadAvg5  $loadAvg15   $raidUsed  $ssdUsed   $raidS   $disk1 $disk2   $(lxc-ls)"
echo "${c} 1m    5m   15m    RAID SSD   AR   D1 D2"

echo ''
echo $N
