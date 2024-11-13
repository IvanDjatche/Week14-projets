#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html

mkdir -p /mnt/efs
mount -t efs -o tls ${module.efs.efs_id}:/ /mnt/efs