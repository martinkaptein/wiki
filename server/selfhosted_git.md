# Selfhosted Git

On remote:

- have git installed
- check no shell startup nosense in e.g. .bashrc

If starting fresh repo from scratch:

git init --bare repo-name.git

(Optional: Rename branch `git config --global init.defaultBranch <name>` / `git branch -m <name>`)

On local:

mkdir folder (if don't have yet)

cd folder, git init, git remote add vps git@example.org:my-repo.git, git push vps master
