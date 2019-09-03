#!/bin/bash

#
# make ssh configure file for user ... 
#
userinput() {
    echo "Please input your $1"
    read reply 
    echo "The $1 is $reply is this correct [y|n]"
    read answer
    if test "$answer" != "y"; then
	echo "The reply $reply was wrong, exiting ..."
	exit 1 
    fi
} 

userinput username
user=$reply
userinput hostname 
host=$reply


# define where key is stored here (default $HOME/.ssh/)
pathtokey="$HOME/.ssh"

echo "Generating ssh-key in $pathtokey"

mkdir -p $pathtokey

nsckey="$pathtokey/id_rsa_nsc"

ssh-keygen -t rsa -f $nsckey

cat <<EOF > mysshconfig.txt
Host nsc
 HostName $host 
 User $user
 IdentityFile $nsckey.pub
EOF

echo "BEWARE: you will have to input your password twice" 

scp $nsckey.pub nsc:~/ 

ssh -t nsc 'cat $HOME/id_rsa_nsc.pub >> $HOME/.ssh/authorized_keys ; rm $HOME/id_rsa_nsc.pub'

cat mysshconfig.txt >> $HOME/.ssh/config
rm mysshconfig.txt

echo "Please access the JSI cluster by typing: 
ssh nsc"
