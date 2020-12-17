#!/bin/sh
mkdir -p ~/.ssh/authorized_keys
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys
mkdir -p /var/run/sshd
/usr/sbin/sshd -D &
python app/app.py
