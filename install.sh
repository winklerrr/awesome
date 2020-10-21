#!/bin/bash

set -e

########## FUNCTIONS ##########

function install {
  FILE="$HOME/$1"
  COMMAND="$2"
  DST="$3"

  if [[ "$ALL" == "false" ]]; then
    ADD="$(ask "> Add '$COMMAND $DST' to '$FILE'?")"
  else
    ADD="true"
  fi

  if [[ "$ADD" == "true" ]]; then
    if [[ ! -f "$FILE" ]] || ! grep -Fxq "$COMMAND $DST" "$FILE"; then
      # no file found at all or command not found in the file
      echo -e "\n# load winklerrr/awesome dotfile" >> "$FILE"
      
      if [[ "$FILE" == ".vimrc" ]]; then
        # .vimrc specific commands (vimscript)
        echo "try" >> "$FILE"
        echo "  $COMMAND $DST" >> "$FILE"
        echo "catch" >> "$FILE"
          # don't do anything here
        echo "endtry" >> "$FILE"
      else
        # all the other commands (standard bash)
        echo "if [[ -f \"$DST\" ]]; then" >> "$FILE"
        echo "  $COMMAND $DST" >> "$FILE"
        echo "fi" >> "$FILE"
      fi
      
      echo ">> Successfully added '$COMMAND $DST' to '$FILE'"
    else
      echo ">> '$COMMAND $DST' was already inside '$FILE'"
    fi
  fi
}

function ask {
  while true; do
    read -p "$1 [Y/n/a] " answer
    case "$answer" in
      y|Y|"" ) echo "true" ; return 0;;
      n|N    ) echo "false"; return 1;;
      a|A    ) exit 1;;
    esac
  done
}


########## MAIN ##########

echo
echo "### INSTALLING DOTFILES by winklerrr ###"
echo

# get the current absolute directory
THIS_DIR="$(cd "$(dirname "${BASH_SOURCE}")" &>/dev/null && pwd)"
DOTFILES_DIR="$THIS_DIR/settings/dotfiles"

echo "> Found the dotfiles in '$DOTFILES_DIR'"

# install all scripts
ALL="$(ask "> Do you want to install all dotfiles (bashrc, vimrc, inputrc, etc.)?")"

#         src file          command     dst path
install   ".profile"        "source"    "$HOME/.bashrc"
install   ".bash_profile"   "source"    "$HOME/.bashrc"
install   ".bashrc"         "source"    "$DOTFILES_DIR/bashrc"
install   ".vimrc"          "source"    "$DOTFILES_DIR/vimrc"
install   ".tmux.conf"      "source"    "$DOTFILES_DIR/tmux.conf"
install   ".inputrc"        "\$include" "$DOTFILES_DIR/inputrc"

echo "> Done installing dotfiles"

# install tools
TOOLS="git vim tmux tig xclip bash-completion"
if ask "> Do you want to install necessary tools ($TOOLS)?" >/dev/null; then
  sudo apt update
  sudo apt install -y $TOOLS
fi

# check for git credentials
if ask "> Do you want to check if global git credentials are set?" >/dev/null; then
  name="$(git config --global user.name 2>/dev/null)"
  if [[ "$name" == "" ]]; then
    echo    ">> 'git.name' not set!"
    read -p ">> Please enter a name: " name
    git config --global user.name "$name" &>/dev/null
  fi

  email="$(git config --global user.email 2>/dev/null)"
  if [[ "$email" == "" ]]; then
    echo    ">> 'git.email' not set!"
    read -p ">> Please enter a email: " email
    git config --global user.email "$email" &>/dev/null
  fi

  echo "> Global git credentials are set: $name, $email"
fi

# set further git configs
if ask "> Do you want to set VSCode as your default git editor (also merge and diff tool)?" >/dev/null; then
  git config --global core.editor "code --wait"
  
  git config --global merge.tool vscode
  git config --global mergetool.vscode.cmd 'code --wait "$MERGED"'
  
  git config --global diff.tool vscode
  git config --global difftool.vscode.cmd 'code --wait --diff "$LOCAL" "$REMOTE"'
fi

# reload .bashrc
echo "> All done. Please restart bash in order to activate the new changes (or try: exec bash -l)."
