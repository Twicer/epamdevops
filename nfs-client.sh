#!/bin/bash

yum update && yum install nfs-utils
mkdir -p /mnt/nfs/home && mkdir -p /mnt/nfs/var/nfs-share

systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
