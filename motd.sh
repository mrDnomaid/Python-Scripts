# 2018 dnomaid.co.uk
# Put contents in a file in /etc/profile.d to autorun on login

# Escape code
esc=`echo -en "\033"`

# Set colors
b="${esc}[;96m"
a="${esc}[;95m"
w="${esc}[;90m"
N=`echo -en "${esc}[m\017"`

clear

echo "${b}#  HP PROLIANT"
echo "${a}# fishys.space"
echo "# hi@trobinson.me"

echo ""
echo ""
echo "${b}# TIME IS${w}"
date

echo ""
echo "${a}# LAST LOGINS${w}"
last | head -5

echo ""
echo "${b}# DISK STATS${w}"
hpacucli controller slot=4  physicaldrive all show | grep physical | sed "s/ //g"
df -h | grep blacks

echo ""
echo "${a}# CPU USAGE${w}"
ps -eo pcpu,pid,user,args | sort -k 1 -r | head -5

echo ""
echo "${b}# MEM USAGE${w}"
free -mh

echo ""
echo ""
echo "${N}"
