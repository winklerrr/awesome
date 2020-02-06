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
```