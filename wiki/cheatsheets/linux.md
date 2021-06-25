# Awesome Linux Cheatsheet

## Basic Commands

**Finding information about commands**

Show the full path of a command (use `-a` to show all locations): 

```
which COMMAND
which -a COMMAND
```

Show type information about a command (`-a` to show all locations of the command):

```
type COMMAND
type -a COMMAND
```

Show the manual page of a command:

```
man COMMAND
```

Show the help menu of a command:

```
help COMMAND

# show the help page in the typicall `man` style
help -m COMMAND | less
```

Here on [askubuntu.com](https://askubuntu.com/a/439411/478654) is a nice solution for a function to show either the man page or if there is no man page to show the help page instead.

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

## Handling Output

**Using the null device** (Source: [wikepedia.org](https://en.wikipedia.org/wiki/Null_device))

Use `/dev/null` (the "null device") to discard data and/or output, for example:

```
grep -Fx "search string" input_file > /dev/null
```

(`-F` to interpret the given search string as a so called "fixed string", meaning no regex interpration. `-x` to match whole lines. Instead of `> /dev/null` it would also be possible to use `-x` to tell grep to search quietly.)

**Checking the last exit status** (Source: [tldp.org](https://www.tldp.org/LDP/abs/html/exit-status.html))

To check the exit status of the last command use bashes `$?` like so:

```
echo $?
```

**Pipeing into file and still showing console output** (Source: [askubuntu.com](https://askubuntu.com/questions/24953/using-grep-with-pipe-and-ampersand-to-filter-errors-from-find))

To pipe some command output into a file and still be able to follow all the output in the console, use `tee` like so:

```bash
command |& tee output.txt     # to create a new file
command |& tee -a output.txt  # to append to the file
```

If `|&` is used, command1’s standard error, in addition to its standard output, is connected to command2’s standard input through the pipe;
it is shorthand for `2>&1 |`.
This implicit redirection of the standard error to the standard output is performed after any redirections specified by the command.
