#!/bin/sh
echo $SSH_PUBLIC_KEY
mkdir -p ~/.ssh/authorized_keys || :
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys

mkdir -p /var/run/sshd || :
/usr/sbin/sshd -D &
pwd && ls app
python app/app.py
