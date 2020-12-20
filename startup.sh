#!/bin/sh
rm -rf ~/.ssh/authorized_keys || :
mkdir -p ~/.ssh || :
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys


mkdir -p /var/run/sshd || :
/usr/sbin/sshd -D &

echo "persistence test start"
touch /usr/share/efs/time.log || :
echo $(date) >> /usr/share/efs/time.log
cat /usr/share/efs/time.log
echo "persistence test end"


python app/app.py
