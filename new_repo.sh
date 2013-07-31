REPONAME=${PWD##*/}

read -p "Create and push new repo ${REPONAME}? >> " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
curl -u $(git config user.username) https://api.github.com/user/repos -d "{\"name\":\"${REPONAME}\"}"
git remote add origin git@github.com:$(git config user.username)/${REPONAME}.git
git push origin master
fi
