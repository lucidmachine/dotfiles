# Firefox Add-on SDK
alias ffon='pushd ~/src/addon-sdk-1.14 && source bin/activate && popd'
alias ffoff='gnome-terminal --working-directory=`pwd` && exit'
alias ffrun='cf run --profiledir="/home/watchboy/.mozilla/firefox/se2vhpya.default"'

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
