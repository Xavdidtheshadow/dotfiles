#!/bin/zsh

# deletes a branch and pushes that to the remote

read -p "Are you REALLY sure? This will delete local and remote branches. >> " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git push origin --delete $1
    git branch -D $1
fi
