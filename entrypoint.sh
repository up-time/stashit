#!/bin/sh
echo $SSH_PUBLIC_KEY
rm -rf ~/.ssh/authorized_keys || :
touch ~/.ssh/authorized_keys
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys

mkdir -p /var/run/sshd || :
/usr/sbin/sshd -D &

python app/app.py
