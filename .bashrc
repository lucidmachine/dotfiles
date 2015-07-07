# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# ############
# Sanity Check
# ############
[ -z "$PS1" ] && return


# #######
# Display
# #######
shopt -s checkwinsize # Resize window if necessary after each command 


# ######
# Prompt
# ######
# Color terminal
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
   # We have color support; assume it's compliant with Ecma-48
   # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
   # a case would tend to support setf rather than setaf.)
   color_prompt=yes
    else
   color_prompt=
    fi
fi

# chroot on prompt
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# ###########
# Environment
# ###########


# #######
# History
# #######
shopt -s histappend # Append to the history file, don't overwrite it
HISTCONTROL=ignoreboth # Ignore duplicates and lines which start with whitespace
HISTSIZE=1000
HISTFILESIZE=2000


# #####
# Paths
# #####
shopt -s globstar # '**' in a path will expand to all files in a dir and/or subdirs


# ################
# Program Specific
# ################

# less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# ###################
# Load External Files
# ###################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

for script in ~/bin/site.sh ~/bin/migrate.sh ~/bin/dotcms.sh; do
  if [ -f $script ]; then
    . $script
  fi
done

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
