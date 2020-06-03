#!/usr/bin/env bash
set -e

if [ -f ~/.zshrc ]; then
  echo "Backing Up current .zshrc"
  mkdir -p ~/zshrc_backups
  CDATE=`date +%Y-%m-%d_%H:%M:%S`
  cp ~/.zshrc ~/zshrc_backups/$CDATE
  echo "File backed up to: ~/zshrc_backups/$CDATE"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]
then
  # Iterm2 shell integration https://www.iterm2.com/documentation-shell-integration.html#:~:text=The%20easiest%20way%20to%20install,and%20fish%202.3%20or%20later.
  curl -L https://iterm2.com/shell_integration/zsh \
  -o ~/.iterm2_shell_integration.zsh
  source ~/.iterm2_shell_integration.zsh

  # Add Oh my Zsh https://github.com/ohmyzsh/ohmyzsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Install powerline fonts for zsh https://github.com/powerline/fonts
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts

  ZSH_THEME="agnoster"
fi

PROJECT_DIR=$(pwd)
echo "
export BASH_PROFILE_DIR=$PROJECT_DIR
source \$BASH_PROFILE_DIR/main.sh
" >> ~/.zshrc

vi config.sh