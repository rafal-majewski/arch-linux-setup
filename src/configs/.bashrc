alias c=clear
eval $(keychain --eval --quiet)
source /usr/share/nvm/init-nvm.sh
eval "$(github-copilot-cli alias -- "$0")"
