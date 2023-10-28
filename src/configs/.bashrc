alias c=clear
eval $(keychain --eval --quiet)
source /usr/share/nvm/init-nvm.sh
eval "$(github-copilot-cli alias -- "$0")"

# gcr-ssh-agent
# https://wiki.archlinux.org/title/GNOME/Keyring#gcr-ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
