#!/bin/bash
#
# borrowed from:
# https://gist.github.com/m14t/3056747

git_https2ssh () {
  REPO_URL=`git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`
  if [ -z "$REPO_URL" ]; then
    echo "> ERROR:  Could not identify Repo url"
    echo ">> It is possible that this repo is already using SSH instead of HTTPS"
    echo ">> current: '$(git config remote.config.url)'"
    exit
  fi

  USER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\1#p'`
  if [ -z "$USER" ]; then
    echo "> ERROR:  Could not identify User"
    exit
  fi

  REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\2#p'`
  if [ -z "$REPO" ]; then
    echo "> ERROR:  Could not identify Repo"
    exit
  fi

  NEW_URL="git@github.com:$USER/$REPO.git"
  echo "> Changing repo url"
  echo ">> old: '$REPO_URL'"
  echo ">> new: '$NEW_URL'"
  echo ""

  git remote set-url origin $NEW_URL
  if [ $? -eq 0 ]; then
    echo "> Success"
    return 0
  else
    echo "> Failed"
    return 1
  fi
}
