# tomr.me

# Set colors
esc=`echo -en "\033"`
a="${esc}[;96m"
b="${esc}[;97m"
c="${esc}[;90m"
RED="${esc}[;91m"
YEL="${esc}[;93m"
GRE="${esc}[;92m"
N=`echo -en "${esc}[m\017"`

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
capacity_level=$(cat /sys/class/power_supply/BAT0/capacity_level)
cycles=$(cat /sys/class/power_supply/BAT0/cycle_count)
energy_full=$(cat /sys/class/power_supply/BAT0/energy_full)
energy_full=$((energy_full / 1000000))
energy_full_design=$(cat /sys/class/power_supply/BAT0/energy_full_design)
energy_full_design=$((energy_full_design / 1000000))
energy_now=$(cat /sys/class/power_supply/BAT0/energy_now)
energy_now=$((energy_now / 1000000))
manuf=$(cat /sys/class/power_supply/BAT0/manufacturer)
model=$(cat /sys/class/power_supply/BAT0/model_name)
serial=$(cat /sys/class/power_supply/BAT0/serial_number)
status=$(cat /sys/class/power_supply/BAT0/status)
tech=$(cat /sys/class/power_supply/BAT0/technology)
type=$(cat /sys/class/power_supply/BAT0/type)
voltage_min_design=$(cat /sys/class/power_supply/BAT0/voltage_min_design)
voltage_min_design=$((voltage_min_design / 1000000))
voltage_now=$(cat /sys/class/power_supply/BAT0/voltage_now)
voltage_now=$((voltage_now / 1000000))


echo "${a}==BATTERY INFO=="
echo ""
echo "${b}${manuf} ${model} ${tech} ${type} (Serial: ${serial})"
echo "${b}Now: ${a}${status}"
echo "${b}Full Capacity: ${a}${capacity}${b}, Curr Capacity: ${capacity_now}"
echo "${b}Design Energy: ${a}${energy_full_design}Wh${b}, Energy Full: ${a}${energy_full}Wh${b}, Energy Now: ${a}${energy_now}Wh"
echo "${b}Voltage Design Min: ${a}${voltage_min_design}v${b}, Voltage Now: ${a}${voltage_now}v"
echo "${b}Charge Cycles: ${a}${cycles}"
