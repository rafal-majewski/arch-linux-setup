#!/bin/sh
autorandr --change
eval "$(ssh-agent -s)" > /dev/null
ssh-add "$HOME/.ssh/id_ed25519"
setxkbmap pl
exec i3
