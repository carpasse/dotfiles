#!/usr/bin/env bash
set -e

if [ -f ~/.zshrc ]; then
  echo "Backing Up current .zshrc"
  mkdir -p ~/zshrc_backups
  CDATE=`date +%Y-%m-%d_%H:%M:%S`
  cp ~/.zshrc ~/zshrc_backups/$CDATE
  echo "File backed up to: ~/zshrc_backups/$CDATE"
fi

PROJECT_DIR=$(pwd)
cat <<< "
export BASH_PROFILE_DIR=$PROJECT_DIR
source \$BASH_PROFILE_DIR/main.sh
" > ~/.zshrc

vi config.sh