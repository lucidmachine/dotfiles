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


# #########################
# Terminal Prompt and Title
# #########################

# Does this terminal support color?
case "$TERM" in
    *color|cygwin)
        color_prompt=yes
        ;;
esac

# chroot path
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Mercurial branch
hg_branch () {
    hg branch 2> /dev/null | sed -e "s/\(.*\)/ (\1)/"
}

# Load color palette
. "$HOME/.bash/.palette"

# Set prompt
if [ "$color_prompt" = yes ]; then
    term_prompt="\n${debian_chroot:+($debian_chroot)}$BGreen\u@\h $BBlue\w$BWhite\$(__git_ps1)\$(hg_branch)$Color_Off\n\$ "
else
    term_prompt="\n${debian_chroot:+($debian_chroot)}\u@\h \w\$(__git_ps1)\$(hg_branch)\n\$ "
fi

# Set terminal title
case "$TERM" in
xterm*|rxvt*|cygwin)
    term_title="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
    ;;
*)
    ;;
esac

# Set PS1
PS1="$term_prompt$term_title"

# Cleanup variables
unset color_prompt force_color_prompt term_prompt term_title


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


# #########
# Dev Tools
# #########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ###################
# Load External Files
# ###################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

