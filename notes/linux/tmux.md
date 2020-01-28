# Awesome tmux Notes

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
```

## Pane management

```
PRE + z  # toggle pane zoom
```

**Resizing the current active pane**

```
:resize-pane -D 10 
:resize-pane -U 10 
resi
:resize-pane -R 10
```
