#! /bin/bash
#
# Sets up the symlinks to the bash config files.

# Select appropriate OS branch
case "$OSTYPE" in
    msys|win32)
        git checkout windows
        ;;
    *)
        git checkout master
        ;;
esac

# Symlink bash dotfiles
for dotfile in .bash_aliases .bash_logout .bashrc .profile; do
    echo ""
    
    # Check whether to delete existing copies
    if [ -f "$HOME/$dotfile" ]; then

        # Prompt
        echo "$HOME/$dotfile already exists. Overwrite? (y/N): "
        read overwrite

        if [ "$overwrite" != "y" ] && [ "$overwrite" != "Y" ]; then
            # Don't delete
            continue
        else
            # Delete
            rm "$HOME/$dotfile"
        fi
    fi

    # Create a symlink in home pointing to the dotfile in this directory
    ln -s "`pwd`/$dotfile" "$HOME/$dotfile"

    # Source the new file
    . "$HOME/$dotfile"

done