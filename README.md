# Useful Commands & Tools - The Awesome List!

Keep in mind: 

> "Reading is thinking with someone else's head" - Arthur Schopenhauer

So use `man`!

## Basic Linux Management

```
which python
type python
```

## SSH & Key Management

Add a key to ssh:

```
eval `ssh-agent`
ssh-add ./id_rsa
```

**Convert a ssh2 key to openssh format** (Source: [tutoriallinux](https://tutorialinux.com/convert-ssh2-openssh/))

```
# directly write to a file
ssh-keygen -i -f ssh2.pub > openssh.pub

# just print the output
ssh-keygen -i -f ssh2.pub
```

## Git Management

Basic git commands:

```
git fetch
git pull
git push

git status
git log

git commit -m "message"
```

Working with branches:

```
git branch  # show local branches and currently checked out branch
git branch -l -r  # list all remote branches
git branch -d <branch-name>  # delete branch
git checkout -b <new-branch>  # create and checkout new branch
```

**Set git credentials**

```
git config --global user.email "you@domain.com"
git config --global user.name "Sandro Winkler"
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

### [tig](https://jonas.github.io/tig/)

```
H  # help view
s  # status view
enter  # to show diff

u  # stage/unstage whole file
1  # stage single line
```

## Window & Session Management

### tmux

Reminder: to select text and to paste from clipboard hold `SHIFT` while pressing `LEFT CLICK` or `RIGHT CLICK`.

`PRE` stands for the tmux prefix (normally `STRG`+`b`, maybe changed to `STRG`+`a`).

**Creating and managing sessions**

```
tmux new -s name  # create new session with name
tmux ls  # show all sessions
tmux a  # append last session
```

**Window management**

```
```

**Pane management**

```
PRE + z  # toggle pane zoom
```


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
