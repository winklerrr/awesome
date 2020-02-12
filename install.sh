#!/bin/bash

function install {
  FILE="$1"
  LINE="$2"

  if [[ ! -f "$FILE" ]] || ! grep -Fxq "$LINE" "$FILE"; then
    echo "$LINE" >> "$FILE" && echo "> Successfully added '$LINE' to '$FILE'"
  else
    echo "> '$LINE' was already added to '$FILE'"
  fi
    
}


echo "### INSTALLING DOTFILES by winklerrr ###"

# get the current absolute directory
THIS_DIR="$(cd "$(dirname "${THIS}")" >/dev/null 2>&1 && pwd)"
DOTFILES_DIR="$THIS_DIR/dotfiles"
echo "> Found the dotfiles in '$DOTFILES_DIR'"

# install all scripts
install "$HOME/.bashrc" "source $DOTFILES_DIR/bashrc"
install "$HOME/.vimrc" "source $DOTFILES_DIR/vimrc"
install "$HOME/.tmux.conf" "source $DOTFILES_DIR/tmux.conf"
install "$HOME/.inputrc" "\$include $DOTFILES_DIR/inputrc"
echo "> Installed all dotfiles"

# reload .bashrc
source "$HOME/.bashrc"
echo "> Reloaded '$HOME/.bashrc'"

echo "> Done"
