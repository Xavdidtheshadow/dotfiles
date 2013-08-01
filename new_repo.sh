# Uses the name of the current directory for the name of the repo (the repo name can be specified by the -n or --name flag.

# If you're having an issue with authentication, use git config --global user.username "GIT_USERNAME" 

REPONAME=${PWD##*/}

if [[ $1 == *-n* ]] || [[ $1 == *--name* ]]
then
    REPONAME=$2
fi

read -p "Create and push new repo ${REPONAME}? >> " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -u $(git config user.username) https://api.github.com/user/repos -d "{\"name\":\"${REPONAME}\"}"
    git remote add origin git@github.com:$(git config user.username)/${REPONAME}.git
    git push origin master
fi
