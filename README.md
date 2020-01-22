# Useful Commands & Tools

Keep in mind: 

> "Reading is thinking with someone else's head" - Arthur Schopenhauer

So use `man`!

## Git Management

### tig

## Window & Session Management

### tmux



## Processes Management

[howtogeek](https://www.howtogeek.com/107217/how-to-manage-processes-from-the-linux-terminal-10-commands-you-need-to-know/)

Show running processes:

```
top
htop
ps -A
```

Directly grep a PID or kill a process:

```
pgrep
pkill
```

**How to kill a process**

Use `pgrep [name]` or `pkill [name]`:

```
kill $(pgrep firefox)
pkill firefox
```
