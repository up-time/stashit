#!/bin/sh
echo $SSH_PUBLIC_KEY
rm -rf ~/.ssh/authorized_keys || :
touch ~/.ssh/authorized_keys || :
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys
mkdir -p /var/run/sshd || :
/usr/sbin/sshd -D &
##persistence testing
##persistence testing
##persistence testing
echo "persistence test start"
touch /usr/share/efs/time.log || :
echo date >> /usr/share/efs/time.log
cat /usr/share/efs/time.log
echo "persistence test end"
##persistence testing
##persistence testing
##persistence testing
python app/app.py
