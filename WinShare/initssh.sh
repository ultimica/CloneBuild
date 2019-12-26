#!/bin/bash
echo "init ssh key to root ..."
eval $(ssh-agent)
ssh-add "/MySSHKey/id_rsa"
# rsync -avzh /root/WinShare/lib32/*  /usr/lib32/
rsync -avzh /root/WinShare/lib32/*  /lib/i386-linux-gnu/

git config --global user.email "liweihuang@fatek.com" 
git config --global user.name "liweihuang" 