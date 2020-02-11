# Awesome dotfiles

## Installing the dotfiles

1. Clone the repo to the `awesome` folder in your home path:

```
git clone git@github.com:winklerrr/awesome.git ~/awesome
```

2. Then add `source` commands to the corresponding config files:

```
# for .bashrc
echo "source ~/awesome/dotfiles/bashrc" >> ~/.bashrc && source ~/.bashrc

# for .vimrc
echo "source ~/awesome/dotfiles/vimrc" >> ~/.vimrc

# for .tmux.conf
echo "source ~/awesome/dotfiles/tmux.conf" >> ~/.tmux.conf && tmux source-file ~/.tmux.conf

# for .inputrc
echo '$include ~/awesome/dotfiles/inputrc' >> ~/.inputrc
```

## Aliases & Functions

The awesome dotfiles come with some predefined aliases and new functions!
(To see a list of all currently set aliases use: `alias`)

