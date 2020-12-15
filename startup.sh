#!/bin/sh
echo $SSH_PUBLIC_KEY > ~/.ssh/authorized_keys
## efs_persistence test
#touch /efs_persistence/itworked.test.log || :
#date > /efs_persistence/itworked.test.log
#echo /efs_persistence/itworked.test.log
python app/app.py