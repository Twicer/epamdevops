#!/bin/bash
####[changing ssh port]######
#before changing port
#disabled selinx in /etc/selinux/conf and reboot
#then
echo "Port 2200" >> /etc/ssh/sshd_config
systemctl restart sshd
