#!/bin/bash

#####  [Installing nfs-server]  ######
yum install nfs-utils -y
/sbin/chkconfig nfs on
systemctl start nfs && systemctl enable nfs
mkdir /var/nfs-share && chmod 777 -R 777 /var/nfs-share
systemctl start rpcbind nfs-server nfs-lock

echo "/var/nfs-share    10.18.0.1(rw,sync,no_root_squash,no_all_squash)" >> /etc/export
echo "/home             10.18.0.1(rw,sync,no_root_squash,no_all_squash)" >> /etc/export

systemctl restart nfs

firewall-cmd —permanent —add-port=111/tcp
firewall-cmd —permanent —add-port=54302/tcp
firewall-cmd —permanent —add-port=20048/tcp
firewall-cmd —permanent —add-port=2049/tcp
firewall-cmd —permanent —add-port=46666/tcp
firewall-cmd —permanent —add-port=42955/tcp
firewall-cmd —permanent —add-port=875/tcp
firewall-cmd —permanent —zone=public —add-service=nfs
firewall-cmd —permanent —zone=public —add-service=mount
firewall-cmd —permanent —zone=public —add-service=rpc-bind
firewall-cmd --reload
#####  [Done] #################
