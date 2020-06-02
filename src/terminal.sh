# Add color to terminal
# from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# and https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/ls.1.html
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Add Oh my Zsh https://github.com/ohmyzsh/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerline fonts for zsh https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

ZSH_THEME="agnoster"


# Iterm2 shell integration https://www.iterm2.com/documentation-shell-integration.html#:~:text=The%20easiest%20way%20to%20install,and%20fish%202.3%20or%20later.
curl -L https://iterm2.com/shell_integration/zsh \
-o ~/.iterm2_shell_integration.zsh
source ~/.iterm2_shell_integration.zsh

# brew shell completion https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

chmod go-w "$(brew --prefix)/share"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Change Prompt
setopt PROMPT_SUBST
PROMPT='%{%F{green}%}%9c%{%F{yellow}%}$(parse_git_branch)%{%F{none}%}$ '
# export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '
# export PS2='| => '