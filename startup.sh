#!/bin/sh
echo $SSH_PUBLIC_KEY
echo "1"
rm -rf ~/.ssh/authorized_keys || :
echo "2"
touch ~/.ssh/authorized_keys || :
echo "3"
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys
echo "4"
mkdir -p /var/run/sshd || :
echo "5"
/usr/sbin/sshd -D &
echo "6"
python app/app.py
