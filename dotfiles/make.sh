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
DIR="$(cd "$(dirname "${THIS}")" >/dev/null 2>&1 && pwd)"
echo "> Found the dotfiles in '$DIR'"

# install all scripts
install "$HOME/.bashrc" "source $DIR/bashrc"
install "$HOME/.vimrc" "source $DIR/vimrc"
install "$HOME/.tmux.conf" "source $DIR/tmux.conf"
install "$HOME/.inputrc" "\$include $DIR/inputrc"
echo "> Installed all dotfiles"

# reload .bashrc
source "$HOME/.bashrc"
echo "> Reloaded '$HOME/.bashrc'"

echo "> Done"
