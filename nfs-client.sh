#!/bin/bash

#yum update
yum install nfs-utils -y
mkdir -p /mnt/nfs/home && mkdir -p /mnt/nfs/var/nfs-share
systemctl start nfs && systemctl enable nfs

systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock

mount -t nfs 10.18.0.1:/home /mnt/nfs/home/
mount -t nfs 10.18.0.1:/var/nfsshare /mnt/nfs/var/nfsshare/


