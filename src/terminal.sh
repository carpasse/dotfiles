# Add color to terminal
# from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# and https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/ls.1.html
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Iterm2 shell integration
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

# Bash completion
if [ -f `brew --prefix`/usr/local/Cellar/bash-completion/1.3_3/etc/bash_completion ]; then
  . `brew --prefix`/usr/local/Cellar/bash-completion/1.3_3/etc/bash_completion
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Change Prompt
setopt PROMPT_SUBST
PROMPT='%{%F{green}%}%9c%{%F{yellow}%}$(parse_git_branch)%{%F{none}%}$ '
# export PS1='\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ '
# export PS2='| => '