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

### tig

## Window & Session Management

### tmux



## Processes Management

**Sources:**
- [howtogeek](https://www.howtogeek.com/107217/how-to-manage-processes-from-the-linux-terminal-10-commands-you-need-to-know/)

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

**How to kill a process**

Use `pgrep [name]` or `pkill [name]`:

```
kill $(pgrep firefox)
pkill firefox
```
