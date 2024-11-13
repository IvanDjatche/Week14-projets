#!/bin/bash
mkdir -p /home/ec2-user/.ssh
cp /etc/ssh/${module.keypair.Name_key}.pem /home/ec2-user/.ssh/
chmod 400 /home/ec2-user/.ssh/${module.keypair.Name_key}.pem