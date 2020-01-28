# Awesome Git

## Basics

```
git fetch
git pull
git push

git status
git log
```

## Commits

```
git commit -m "message"
git commit -a  # adding all changes to stage
git commit --amend  # adding staged changes to last commit
```

**Unstaging commits**

```
git reset HEAD~1  # remove commits
```

**Rename commit messages**

1. To rename one or more of the last `n` commits use:

```
git rebase -i HEAD~n
```

2. Replace the keyword `pick` in front of the commits which should be renamed by the keyword `reword` (short `r`).
3. Save and close the commit list file. 
4. The resulting commit files open automatically, change the commit message.

## Branches

```
git branch  # show local branches and currently checked out branch
git branch -l -r  # list all remote branches
git branch -d <branch-name>  # delete branch
git checkout -b <new-branch>  # create and checkout new branch
```

**Only show the current branch**

```
git branch | grep '*'
```

**Checking out a remote branch** (Source: [atlassian](https://www.atlassian.com/git/tutorials/using-branches/git-checkout))

```
git fetch --all
git checkout --track <remote-branch>  # create a new local branch which tracks the remote one
```

## Configs

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

**Change remote URL from https to ssh** (Source: [github](https://help.github.com/en/github/using-git/changing-a-remotes-url))

Show remote urls:

```
git remote -v
```

Change remote url:

```
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```
