# Useful Commands & Tools

Keep in mind: 

> "Reading is thinking with someone else's head" - Arthur Schopenhauer

So use `man`!

## SSH & Key Management

Add key to ssh:

```
eval `ssh-agent`
ssh-add ./id_rsa
```

## Git Management

Basic git commands:

```
git fetch
git pull

git status
git log
```

Working with branches:

```
git branch  # show local branches and currently checked out branch
git branch -l -r  # list all remote branches
git branch -d <branch-name>  # delete branch
git checkout -b <new-branch>  # create and checkout new branch
```

**Checking out a remote branch**

```
git fetch --all
git checkout <remote-branch>
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


### tig

## Window & Session Management

### tmux

Reminder: to paste from clipboard use `SHIFT`+`RIGHT CLICK`



## Processes Management

Show running processes:

```
top
htop
ps -A
```

Directly grep a PID or kill a process:

```
kill PID
pgrep
pkill
```

**How to kill a process** (Source: [howtogeek](https://www.howtogeek.com/107217/how-to-manage-processes-from-the-linux-terminal-10-commands-you-need-to-know/))

Use `pgrep <name>` or `pkill <name>`:

```
kill $(pgrep firefox)
pkill firefox
```
