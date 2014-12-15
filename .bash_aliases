# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# du
alias du='du -c -h'

# grep
alias grep='grep --color=auto'

# ls
alias ls='ls -h --color'
alias ll='ls --color -lha'

# Vimming!
alias vim='vim -p'
