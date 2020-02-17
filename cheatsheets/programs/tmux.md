# Awesome tmux Cheatsheet

**Reminder:** `PRE` stands for the tmux prefix (normally `STRG`+`b`, maybe changed to `STRG`+`a`)

## Basics

- **Copy/Paste:** To select text and to paste from clipboard hold `SHIFT` while pressing `LEFT CLICK` or `RIGHT CLICK`
- **Command line:** To enter the tmux command line, hit `PRE` and `:`


## Session management

```
tmux new -s name  # create new session with name
tmux ls  # show all sessions
tmux a  # append last session
```

## Window management

```
PRE + c  # create new window
PRE + &  # close current window

PRE + p  # switch to previous window
PRE + n  # switch to next window
PRE + 0..9  # switch to window
```

## Pane management

Splitting panes:

```
PRE + %  # vertically
PRE + "  # horizontally
```

Switching panes:

```
PRE + q  # show pane numbers
PRE + q + 0..9  # switch to pane

PRE + ;  # switch to last active pane
```

Other stuff:

```
PRE + x  # close current pane
PRE + !  # convert pane into window
PRE + z  # toggle pane zoom
```

**Resizing the current pane**

```
:resize-pane -D 10 
:resize-pane -U 10 
:resize-pane -L 10
:resize-pane -R 10
```
