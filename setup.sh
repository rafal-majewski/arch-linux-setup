#!/bin/sh

echo "Updating what's currently installed using Pacman..."
sudo pacman -Syu

echo "Checking if the git user name is set..."
if [ -z "$(git config --global user.name)" ]; then
	read -p "Enter your git user name: " GIT_USER_NAME
	echo "Setting the git user name..."
	git config --global user.name "$GIT_USER_NAME"
fi
