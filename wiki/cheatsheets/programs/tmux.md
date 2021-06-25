# Awesome tmux Cheatsheet

**Reminder:** `<PRE>` stands for the tmux prefix (normally `<CTRL>b` aka. `<C-b>`, maybe changed to `<CTRL>a` aka. `<C-a>`)

## Basics

- **Copy/Paste:** To select text and to paste from clipboard hold `<SHIFT>` while pressing `<LEFT CLICK>` or `<RIGHT CLICK>`
- **Command line:** To enter the tmux command line, hit `<PRE>` and `:`
- `<PRE>?` - show help


## Session management

- `tmux new [-s name]` (`:new`) - create a new session with `name`
- `tmux attach [-t name]` (`:attach`) - attach to the last session or to the session with `name`
- `<PRE>d`, `tmux detach` (`:detach`) - detach from the current session
- `<PRE>s`, `tmux ls` (`:ls`) - list all sessions
- `<PRE>$`, `tmux rename-session [-t name] name` - rename session
- `<PRE>(`, `<PRE>)` - switch to the next/previous session

## Window management

- `<PRE>c` - create new window
- `<PRE>&` - kill current window
- `<PRE>p` - switch to previous window
- `<PRE>n` - switch to next window
- `<PRE>l` - switch to last window
- `<PRE>0..9` - switch to window

## Pane management

Splitting panes:

- `<PRE>%` - vertically
- `<PRE>"` - horizontally

Switching panes:

- `<PRE>q` - show pane numbers
- `<PRE>q0..9` -  switch to pane
- `<PRE>;` - switch to last active pane

Other stuff:

- `<PRE>x` - kill current pane
- `<PRE>!` - convert pane into window
- `<PRE>z` - toggle pane zoom

Resizing the current pane:

```
:resize-pane -D 10 
:resize-pane -U 10 
:resize-pane -L 10
:resize-pane -R 10
```
