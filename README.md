# Born2beroot

Born2beroot is a system administration project from the Hive curriculum that focuses on setting up and hardening a Linux-based virtual machine. The goal is to gain a practical understanding of server management, user roles, and basic cybersecurity principles.

## 🚀 Project Overview

The objective of Born2beroot is to create a secure and stable virtual server using **Debian**, and configure it according to strict guidelines. This project serves as an introduction to:

- Operating system installation
- Partitioning and logical volume management (LVM)
- User and permission management
- SSH configuration and firewall setup
- System monitoring and automation

## 📁 Project Scope

This repository contains:

- A **signature file** proving the integrity and configuration of the Virtual Machine
- A **Bash script** run by `cron` every 10 minutes that performs system diagnostics and monitoring

### ✅ Mandatory Part

The mandatory portion of the project covers:

- Installing a Linux operating system on a virtual machine using VirtualBox
- Setting up a strong password policy and sudo privileges
- Configuring hostname, user groups, and system updates
- Enabling and configuring **UFW** (Uncomplicated Firewall)
- Installing and enabling **SSH** for secure remote access
- Writing and enabling a custom **cron job** to monitor system status and send reports

### 🧩 Bonus Part (Partial)

Completed the bonus section related to **partitioning**, which includes:

- Setting up multiple partitions during OS installation
- Using **LVM (Logical Volume Manager)** for better flexibility in disk management
- Allocating separate mount points for directories like `/home`, `/var`, and `/tmp`

### 🔍 Cron Job Monitoring Script

This script runs automatically every 10 minutes and gathers the following information:

- Architecture of the operating system and kernel version  
- Number of physical processors  
- Number of virtual processors  
- Available RAM and its usage rate (%)  
- Available disk space and its usage rate (%)  
- CPU usage rate (%)  
- Date and time of the last reboot  
- LVM usage status (active or not)  
- Number of active connections  
- Number of currently logged-in users  
- IPv4 address and MAC address  
- Number of commands executed with `sudo`

## 🔧 How It Works

Once the virtual machine is installed and configured, the server maintains:

- Secure user authentication (password policy + sudo-only access)
- Automated monitoring via cron
- Controlled access with SSH and UFW
- Logical partitioning of disk space for security and performance

## 🧠 What I Learned

- Installing and configuring a secure Linux system from scratch
- Managing users, permissions, and groups responsibly
- Automating monitoring and maintenance tasks
- Understanding the role of firewalls, SSH, and system services
- Working with LVM and disk partitioning for scalable storage

