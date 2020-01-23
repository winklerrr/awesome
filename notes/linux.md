# Awesome Linux

## Basic Linux Management

```
which python
type python
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
