# 2018 dnomaid.co.uk
# Put contents in a file in /etc/profile.d to autorun on login

# Escape code
esc=`echo -en "\033"`

# Set colors
cc_red="${esc}[0;31m"
cc_green="${esc}[0;32m"
cc_yellow="${esc}[0;33m"
cc_blue="${esc}[0;34m"
cc_normal=`echo -en "${esc}[m\017"`

clear

echo "${cc_red}#####   HP PROLIANT   #####"
echo "${cc_green}#####  fishys .space  #####"
echo "##### hi@trobinson.me #####${cc_yellow}"

echo ""
echo ""
echo "${cc_blue}#####  TIME  IS  #####${cc_yellow}"
date

echo ""
echo "${cc_blue}##### LAST LOGIN #####${cc_yellow}"
last | head -5

echo ""
echo "${cc_blue}##### DISK STATS #####${cc_yellow}"
hpacucli controller slot=4  physicaldrive all show | grep physical | sed "s/ //g"
df -h | grep blacks

echo ""
echo "${cc_blue}##### CPU USAGE #####${cc_yellow}"
ps -eo pcpu,pid,user,args | sort -k 1 -r | head -5

echo ""
echo "${cc_blue}#### MEM USAGE #####${cc_yellow}"
free -mh

echo ""
echo ""
echo "${cc_normal}"
