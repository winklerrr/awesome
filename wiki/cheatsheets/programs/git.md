# Awesome Git Cheatsheet

## Basics

```
git fetch
git pull
git push

git status
git log
```

**Create a new repo and connect with online repo**

```
touch README.md

# init new repo
git init
git add README.md
git commit -m "first commit"

# connect with online repo
git remote add origin SSH-URL-HERE
git push -u origin master
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

**Showing the changes of a commit** (Source: [stackoverflow.com](https://stackoverflow.com/questions/17563726/how-to-see-the-changes-in-a-git-commit))

Use the `COMMIT` hash:

```
git show COMMIT
```

**Pushing a detached head** (Source: [redgreenrepeat.com](http://redgreenrepeat.com/2018/06/08/how-to-push-a-detached-git-head/))

The general command looks like:

```
git push <remote name> HEAD:<remote branch name>
```

For example:

```
git push origin HEAD:testing
```

## Branches

```
git branch  # show local branches and currently checked out branch
git branch -l -r  # list all remote branches
git branch -d <branch-name>  # delete branch
git checkout -b <new-branch>  # create and checkout new branch
```

**Only show the current branch**

Print the current branch (the one with the asterik when doing `git branch`):

```
git branch | grep '*' | cut -c 3-
```

Use `cut` to cut off the beginning of the resulting string (starting at the 3rd position).

**Checking out a remote branch** (Source: [atlassian.com](https://www.atlassian.com/git/tutorials/using-branches/git-checkout))

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

**Change remote URL from https to ssh** (Source: [github.com](https://help.github.com/en/github/using-git/changing-a-remotes-url))

Show remote urls:

```
git remote -v
```

Change remote url:

```
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```
