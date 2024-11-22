#!/bin/bash

ARCHI=$(uname -a)
CPU=$(grep 'physical id' /proc/cpuinfo | sort -u | wc -l)
VCPU=$(grep 'processor' /proc/cpuinfo | wc -l)
RAM_TOTAL=$(free --mega | awk '$1 == "Mem:" {print $2}')
RAM_USED=$(free --mega | awk '$1 == "Mem:" {print $3}')
RAM_PERCENT=$(free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
DISK_TOTAL=$(df -h --total | grep total | awk '{print $2}')
DISK_USED=$(df -h --total | grep total | awk '{print $3}')
DISK_PERCENT=$(df -h --total | grep total | awk '{print $5}')
CPU_UT=$(top -bn 1 | grep 'Cpu' | awk {'printf("%.1f%%", $2+$4)'})
REBOOT=$(who -b | awk '{printf("%s %s"), $3, $4}')
LVM_NUMBER=$(lsblk | grep -c 'lvm')
LVM_USE=$(if [ $LVM_NUMBER -eq 0 ]; then echo no; else echo yes; fi)
TCP=$(ss | grep 'tcp' | grep 'ESTAB' | wc -l)
USER=$(users | wc -w)
IP=$(hostname -I)
MAC=$(ip a | grep 'ether' | awk '{print $2}')
SUDO=$(journalctl _COMM=sudo | grep -c 'COMMAND')

wall "
    # Architecture: $ARCHI
    # Number of physical CPUs: $CPU
    # Number of virtual CPUs: $VCPU
    # Memory usage: $RAM_USED / $RAM_TOTAL MB ($RAM_PERCENT)
    # Disk usage:  $DISK_USED / $DISK_TOTAL ($DISK_PERCENT)
    # CPU load: $CPU_UT
    # Last reboot: $REBOOT
    # LVM use: $LVM_USE
    # Number of active connections: $TCP
    # Logged users: $USER
    # Network: $IP IP ($MAC)
    # Sudo commands: $SUDO cmd
    "