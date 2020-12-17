#!/bin/sh
echo $SSH_PUBLIC_KEY
mkdir -p ~/.ssh/authorized_keys || :
mkdir -p /var/run/sshd || :
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys
/usr/sbin/sshd -D &
pwd
python app/app.py
