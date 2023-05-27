# Selfhosted Git

On remote:

- have git installed
- check no shell startup nosense in e.g. .bashrc

useradd -m git -d /var/git -s /bin/bash

su -l git

If starting fresh repo from scratch:

git init --bare repo-name.git

(Optional: Rename branch `git config --global init.defaultBranch <name>` / `git branch -m <name>`)

```
mkdir /var/git/.ssh	
cp ~/.ssh/authorized_keys /var/git/.ssh/
chown git:git -R /var/git/.ssh
```

On local:

mkdir folder (if don't have yet)

cd folder, git init, git remote add vps git@example.org:my-repo.git, git add, commit, git push vps master

for future pushes:

```
git push --set-upstream vps main/master
```

## Stuff

Merges:

```
git config pull.rebase false
```
