#!/bin/bash

set -e

########## FUNCTIONS ##########

install() {
  local dst="$1"
  local file="$HOME/$1"
  local cmd="$2 $3"
  local src="$3"

  if [ "$install_all" = true ]; then
    add="true"
  else
    ask "> Add '$cmd' to '$file'?" add
  fi

  if [ "$add" = true ]; then
    # grep:
    # -F = interpret string as literal, not as regex
    # -q = quiet 
    if [[ ! -f "$file" ]] || ! grep -Fq "$cmd" $file; then
      # file does not yet exist or cmd not found in the file

      if [[ "$dst" == ".vimrc" ]]; then
        # .vimrc specific cmd (vimscript)
        echo -e '\n" installed by winklerrr/awesome' >> "$file"
        echo "try" >> "$file"
        echo "  $cmd" >> "$file"
        echo "catch" >> "$file"
        # don't do anything in the catch case
        echo "endtry" >> "$file"
      elif [[ "$dst" == ".tmux.conf" ]]; then
        # .tmux.conf specific cmd
        echo -e "\n# installed by winklerrr/awesome" >> "$file"
        echo "if-shell -b 'test -f $src' \\" >> "$file"
        echo "  '$cmd'" >> "$file"
      else
        # all the other cmd (standard bash)
        echo -e "\n# installed by winklerrr/awesome" >> "$file"
        echo "if [ -f \"$src\" ]; then" >> "$file"
        echo "  $cmd" >> "$file"
        echo "else" >> "$file"
        echo "  echo \"$dst: unable to load '$src'!\"" >> "$file"
        echo "fi" >> "$file"
      fi
      
      echo ">> Successfully added '$cmd' to '$file'"
    else
      echo ">> Did not add '$cmd' to '$file' (already inside)"
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
this_dir="$(cd "$(dirname "${BASH_SOURCE}")" &>/dev/null && pwd)"
dotfiles_dir="$this_dir/dotfiles"
echo "> Found the dotfiles in '$dotfiles_dir'"

# install all dotfiles?
declare install_all
ask "> Do you want to install all dotfiles at once (bashrc, vimrc, inputrc, etc.)?" install_all

# install dotfiles (src) in the appropriate system files (dst)
#         dst file          command         src file
install   ".bashrc"         "source"        "$dotfiles_dir/bashrc"
install   ".bashrc"         "bind -f"       "$dotfiles_dir/inputrc"
install   ".vimrc"          "source"        "$dotfiles_dir/vimrc"
install   ".tmux.conf"      "source-file"   "$dotfiles_dir/tmux.conf"

# install .bashrc (src) in the automatically loaded system files (dst), good overview: https://superuser.com/a/183980/382387
#         dst file          command         src file
install   ".profile"        "source"        "$HOME/.bashrc"
install   ".bash_profile"   "source"        "$HOME/.bashrc"

echo "> Done installing dotfiles"

# install useful tools?
tools="git vim tmux tig xclip bash-completion"
ask "> Do you want to install all necessary/recommended tools: $tools? (sudo needed)" ANSWER
if [ "$ANSWER" = true ]; then
  sudo apt update
  sudo apt install -y $tools
  echo "> Done installing tools"
fi

# check for git credentials?
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

# set further git configs?
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
