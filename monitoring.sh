#!/bin/bash

ARCHI=$(uname -a)
CPU=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
VCPU=$(grep "processor" /proc/cpuinfo | wc -l)
RAM_TOTAL=$(free --mega | awk '$1 == "Mem:" {print $2}')
RAM_USED=$(free --mega | awk '$1 == "Mem:" {print $3}')
RAM_PERCENT=$(free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
DISK_TOTAL=$(df -h --total | grep total | awk '{print $?}')
DISK_USEDL=$(df -h --total | grep total | awk '{print $?}')
DISK_PERCENT=$(df -h --total | grep total | awk '{print $?}')
CPU_UT=$(top -bn 1 | grep 'Cpu' | awk {'printf("%.1f%%", $2 + $4)'})
REBOOT=$(who -b | awk '{printf("%s %s"), $3, $4}')
LVM_NUMBER=$(lsblk | grep -c 'lvm')
LVM_USE=$(if [ $LVM_NUMBER -eq 0 ]; then echo no; else echo yes; fi)

wall "
    # Architecture: $ARCHI
    # Number of physical CPUs: $CPU
    # Number of virtual CPUs: $VCPU
    # Memort usage: $RAM_USED / $RAM_TOTAL MB ($RAM_PERCENT)
    # Disk usage: $DISK_USED / $DISK_TOTAL GB ($DISK_PERCENT)
    # CPU load:$CPU_UT
    # Last reboot: $REBOOT
    # LVM use: $LVM_USE
    # Number of active connections:
    # Logged users:
    # Nerwork:
    # Sudo commands: 
    "