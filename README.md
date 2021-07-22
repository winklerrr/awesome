# winklerrr's dotfiles
## Awesome Dotfiles, Cheatsheets & More!

Keep in mind:

> "Reading is thinking with someone else's head" - Arthur Schopenhauer

So for god's sake use `man`!

## The Awesome Dotfiles

### Installing the Awesome Dotfiles

1. If `git` isn't installed (e.g. for a new WSL setup), do:

```
sudo apt update && sudo apt install git -y
```

2. Clone the repo to the `awesome` folder in your home path:

```
# using ssh
git clone git@github.com:winklerrr/awesome.git ~/awesome

# using https
git clone https://github.com/winklerrr/awesome.git ~/awesome
```

3. a) Then install the dotfiles by executing `install.sh`. This will also install some necessary packages.

```
bash ~/awesome/install.sh
```

3. b) Or do it manually by adding `source` commands the corresponding config files:

```
# for .bashrc
echo "source ~/awesome/settings/dotfiles/bashrc" >> ~/.bashrc && source ~/.bashrc

# for .vimrc
echo "source ~/awesome/settings/dotfiles/vimrc" >> ~/.vimrc

# for .tmux.conf
echo "source ~/awesome/settings/dotfiles/tmux.conf" >> ~/.tmux.conf && tmux source-file ~/.tmux.conf

# for .inputrc
echo '$include ~/awesome/settings/dotfiles/inputrc' >> ~/.inputrc
```

### Aliases & Functions from the Awesome Dotfiles

The awesome dotfiles come with some predefined aliases and new functions!
(To see a list of all currently set aliases use: `alias`)

Some pretty useful aliases:

- **GIT COMMIT ALL:** add all changes from the current directory and commit them

```
gca YOUR COMMIT MESSAGE HERE
```

- **GIT COMMIT AMEND:** commit with --amend and --no-edit

```
gcamend
```
