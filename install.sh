#!/bin/bash

function install {
  FILE="$HOME/$1"
  LINE="$2"

  if [[ "$ALL" == "false" ]]; then
    ADD="$(ask "> Add '$LINE' to '$FILE'?")"
  else
    ADD="true"
  fi

  if [[ "$add" == "true" ]]; then
    if [[ ! -f "$FILE" ]] || ! grep -Fxq "$LINE" "$FILE"; then
      echo "$LINE" >> "$FILE" && echo ">> Successfully added '$LINE' to '$FILE'"
    else
      echo ">> '$LINE' was already added to '$FILE'"
    fi
  fi
    
}

function ask {
  while true; do
    read -p "$1 [y/n] " answer
    case "$answer" in
      y|Y ) echo "true"; return 0;;
      n|N ) echo "false"; return 1;;
    esac
  done
}

echo
echo "### INSTALLING DOTFILES by winklerrr ###"
echo

# get the current absolute directory
THIS_DIR="$(cd "$(dirname "${BASH_SOURCE}")" &>/dev/null && pwd)"
DOTFILES_DIR="$THIS_DIR/dotfiles"

echo "> Found the dotfiles in '$DOTFILES_DIR'"

# install all scripts
ALL="$(ask "> Do you want to install all the dotfiles?")"

install ".profile"    "source $HOME/.bashrc"
install ".bashrc"     "source $DOTFILES_DIR/bashrc"
install ".vimrc"      "source $DOTFILES_DIR/vimrc"
install ".tmux.conf"  "source $DOTFILES_DIR/tmux.conf"
install ".inputrc"    "\$include $DOTFILES_DIR/inputrc"

echo "> Done installing dotfiles"

# check for git credentials
if ask "> Do you want to check if global git credentials are set?" >/dev/null; then
  name="$(git config --global user.name 2>/dev/null)"
  if [[ "$name" == "" ]]; then
    read -p ">> git.name: " name
    git config --global user.name "$name" &>/dev/null
  fi

  email="$(git config --global user.email 2>/dev/null)"
  if [[ "$email" == "" ]]; then
    read -p ">> git.email: " email
    git config --global user.email "$email" &>/dev/null
  fi

  echo "> Git credentials are all set ($name, $email)"
fi

# reload .bashrc
if ask "> Do you want to reload the .bashrc now?" >/dev/null; then
  source "$HOME/.bashrc"
  echo "> Reloaded '$HOME/.bashrc'"
fi

echo "> All done"
