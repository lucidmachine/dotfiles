# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# du
alias du='du -c -h'

# Git
alias gita='git add'
alias gitb='git branch'
alias gitbn='git checkout -b '
alias gitc='git commit -m '
alias gitca='git commit -a -m '
alias gitco='git checkout'
alias gitd='git diff'
alias gitl='git log -n 5'
alias gits='git status'
alias gitvd='git difftool'

# grep
alias grep='grep --color=auto'

# ls
alias ls='ls -h --color'
alias ll='ls --color -lha'

# Mercurial
alias hga='hg add'
alias hgb='hg branch'
alias hgc='hg commit -m '
alias hgd='hg diff'
alias hgl='hg log -l 5'
alias hgs='hg stat'

# Sublime Text
alias sublime-text='/opt/sublime_text/sublime_text'
alias sublime='/opt/sublime_text/sublime_text'

# Updates
alias update='sudo apt-get update && sudo apt-get upgrade -y'

# Vimming!
alias vim='vim -p'
