#!/bin/sh

echo "Updating what's currently installed using Pacman..."
sudo pacman -Syu

echo "Checking if the git user name is set..."
if [ -z "$(git config --global user.name)" ]; then
	read -p "Enter your git user name: " GIT_USER_NAME
	echo "Setting the git user name..."
	git config --global user.name "$GIT_USER_NAME"
fi

echo "Checking if the git user email address is set..."
if [ -z "$(git config --global user.email)" ]; then
	read -p "Enter your git user email address: " GIT_USER_EMAIL_ADDRESS
	echo "Setting the git user email address..."
	git config --global user.email "$GIT_USER_EMAIL_ADDRESS"
fi
