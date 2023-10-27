# gcr-ssh-agent
# https://wiki.archlinux.org/title/GNOME/Keyring#gcr-ssh-agent
systemctl --user enable gcr-ssh-agent.socket
systemctl --user start gcr-ssh-agent.socket
