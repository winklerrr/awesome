# Awesome Git

Basic git commands:

```
git fetch
git pull
git push

git status
git log

git reset HEAD~1  # remove commits
git commit -m "message"
```

**Working with branches**

```
git branch  # show local branches and currently checked out branch
git branch -l -r  # list all remote branches
git branch -d <branch-name>  # delete branch
git checkout -b <new-branch>  # create and checkout new branch
```

**Check and set git credentials**

To check your current git credentials:

```
git config --list  # to see all the config

# to just check name and email
git config user.name
git config user.email
```

To set new credentials use:

```
# --global is optional
git config --global user.name "Sandro Winkler"
git config --global user.email "you@domain.com"
```

**Checking out a remote branch** (Source: [atlassian](https://www.atlassian.com/git/tutorials/using-branches/git-checkout))

```
git fetch --all
git checkout --track <remote-branch>  # create a new local branch which tracks the remote one
```

**Change remote URL from https to ssh** (Source: [github](https://help.github.com/en/github/using-git/changing-a-remotes-url))

Show remote urls:

```
git remote -v
```

Change remote url:

```
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```

**Only show the current branch**

```
git branch | grep '*'
```
