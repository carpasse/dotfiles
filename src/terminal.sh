
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