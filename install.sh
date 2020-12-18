#!/bin/bash

set -e

########## FUNCTIONS ##########

install() {
  DST="$1"
  FILE="$HOME/$1"
  COMMAND="$2 $3"
  SRC="$3"

  if [ "$INSTALL_ALL" = true ]; then
    ADD="true"
  else
    ask "> Add '$COMMAND' to '$FILE'?" ADD
  fi

  if [ "$ADD" = true ]; then
    # grep:
    # -F = interpret string as literal, not as regex
    # -q = quiet 
    if [[ ! -f "$FILE" ]] || ! grep -Fq "$COMMAND" $FILE; then
      # file does not yet exist or command not found in the file

      if [[ "$DST" == ".vimrc" ]]; then
        # .vimrc specific commands (vimscript)
        echo -e '\n" installed by winklerrr/awesome' >> "$FILE"
        echo "try" >> "$FILE"
        echo "  $COMMAND" >> "$FILE"
        echo "catch" >> "$FILE"
          # don't do anything here
        echo "endtry" >> "$FILE"
      elif [[ "$DST" == ".tmux.conf" ]]; then
        # .tmux.conf specific commands
        echo -e "\n# installed by winklerrr/awesome" >> "$FILE"
        echo "'test -f \"$SRC\"' \\" >> "$FILE"
        echo "  '$COMMAND'" >> "$FILE"
      else
        # all the other commands (standard bash)
        echo -e "\n# installed by winklerrr/awesome" >> "$FILE"
        echo "if [ -f \"$SRC\" ]; then" >> "$FILE"
        echo "  $COMMAND" >> "$FILE"
        echo "else" >> "$FILE"
        echo "  echo \"'$DST': '$SRC' does not exist!\"" >> "$FILE"
        echo "fi" >> "$FILE"
      fi
      
      echo ">> Successfully added '$COMMAND' to '$FILE'"
    else
      echo ">> Did not add '$COMMAND' to '$FILE' (already inside)"
    fi
  fi
}


ask() {  # usage: ask "question" result
  local -n _ask_var=$2  # use -n for variable referencing
  local _ask_answer
  while true; do
    read -p "$1 [Y/n/a] " _ask_answer
    case "${_ask_answer,,}" in
      y|yes|"" ) _ask_var="true" ; break; ;;
      n|no     ) _ask_var="false"; break; ;;
      a|abort  ) exit 1; ;;
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
ask "> Do you want to install all dotfiles at once (bashrc, vimrc, inputrc, etc.)?" INSTALL_ALL

#         dst file          command         src file
install   ".profile"        "source"        "$HOME/.bashrc"
install   ".bash_profile"   "source"        "$HOME/.bashrc"
install   ".bashrc"         "source"        "$DOTFILES_DIR/bashrc"
install   ".bashrc"         "bind -f"       "$DOTFILES_DIR/inputrc"
install   ".vimrc"          "source"        "$DOTFILES_DIR/vimrc"
install   ".tmux.conf"      "source-file"   "$DOTFILES_DIR/tmux.conf"

echo "> Done installing dotfiles"

# install tools
TOOLS="git vim tmux tig xclip bash-completion"
ask "> Do you want to install all necessary/recommended tools: $TOOLS? (sudo needed)" ANSWER
if [ "$ANSWER" = true ]; then
  sudo apt update
  sudo apt install -y $TOOLS
  echo "> Done installing tools"
fi

# check for git credentials
ask "> Do you want to check if global git credentials are set? (git needed)" ANSWER
if [ "$ANSWER" = true ]; then
  set +e  # when git is freshly installed the next command returns 1
  name="$(git config --global user.name 2>/dev/null)"
  if [[ "$name" == "" ]]; then
    echo    ">> 'git.name' not set!"
    read -p ">> Please enter a name: " name
    git config --global user.name "$name" &>/dev/null
  else
    echo ">> 'git.name' already set!"
  fi

  email="$(git config --global user.email 2>/dev/null)"
  if [[ "$email" == "" ]]; then
    echo    ">> 'git.email' not set!"
    read -p ">> Please enter a email: " email
    git config --global user.email "$email" &>/dev/null
  else
    echo ">> 'git.email' already set!"
  fi

  set -e
  echo "> Done setting global git credentials: $name, $email"
fi

# set further git configs
ask "> Do you want to set VSCode as your default git editor, merge and diff tool? (VSCode needed)" ANSWER
if [ "$ANSWER" = true ]; then
  git config --global core.editor "code --wait"
  
  git config --global merge.tool vscode
  git config --global mergetool.vscode.cmd 'code --wait "$MERGED"'
  
  git config --global diff.tool vscode
  git config --global difftool.vscode.cmd 'code --wait --diff "$LOCAL" "$REMOTE"'

  echo "> Done setting default git editor"
fi

ask "> Do you want to set 'core.autocrlf=false' and 'core.filemode=false'? This is useful when working with repositories on WSL! (git needed)" ANSWER
if [ "$ANSWER" = true ]; then
  # autocrlf: don't automatically convert lf to crfl when checking out a repo in Windows
  git config --global core.autocrlf false
  git config --global core.safecrlf false
  git config --global core.filemode false

  echo "> Done setting default git line endings"
fi

# reload .bashrc
echo "> All done. Please restart bash (or try: exec bash -l) in order to activate the new changes."
echo "### THANKS FOR INSTALLING DOTFILES by winklerrr ###"
