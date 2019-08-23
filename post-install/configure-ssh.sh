#!/bin/bash

#
# make ssh configure file for user ... 
#
if [ $# -ne 2 ]; then
    echo "Usage:
    $0 username hostname"
    exit 1
fi

user=$1
hostname=$2

cat <<EOF > mysshconfig.txt
Host nsc
 HostName $hostname 
 User $user
 ForwardX11 yes
 
EOF
cat mysshconfig.txt >> $HOME/.ssh/config
echo "Accses $hostname by typing: 
ssh nsc"
