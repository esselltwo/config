#!/bin/bash

# from https://superuser.com/a/1177176

# Dependencies: xclip, gvim

# Create an "ephemeral" file, that disappears with this process
tmpfile=$(mktemp /tmp/vim-edit-clipboard.XXXXXX)
exec 3>"$tmpfile"
rm $tmpfile

# It's unlinked, but can be referred to by other processes using /proc
ephemeral_path=/proc/$$/fd/3

# Paste to the file
xclip -selection clipboard -o > $ephemeral_path
# Edit it. Make Vim respect the presence or lack of EOL at EOF
gvim --nofork -c 'set nofixeol' $ephemeral_path
# Then copy it to the clipboard, removing the newline at the end
xclip -selection clipboard < $ephemeral_path
