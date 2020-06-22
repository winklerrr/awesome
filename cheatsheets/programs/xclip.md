# Awesome XCLIP Cheatsheet

## Installation

To copy/paste console output install `xclip`:

```
sudo apt install xclip
```


## Basic Usage

To use `xclip` do:

```
# copy
cat file | xclip

# paste
xclip -o
```

## Advanced Usage

To copy/paste to the system clipboard use:

```
# copy
cat file | xclip -selection clipboard
cat file | xclip -sel clip

# paste
xclip -selection clipboard -o
xclip -sel clip -o
```

## Alias

For better usability create an alias like:

```
alias "cs=xclip -sel clip"
alias "vs=xclip -sel clip -o"
```
