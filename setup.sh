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

echo "Checking if Yay is installed..."
if ! command -v yay &> /dev/null; then
	echo "Installing the \"base-devel\" package for Yay..."
	sudo pacman -S base-devel
	echo "Installing Git for Yay..."
	sudo pacman -S git
	echo "Installing Yay..."
	CURRENT_WORKING_DIRECTORY_PATH=$(pwd)
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	cd ./yay
	makepkg -si
	cd "$CURRENT_WORKING_DIRECTORY_PATH"
	rm -rf /tmp/yay
fi

echo "Updating what's currently installed using Yay..."
yay -Syu

echo "Installing OpenSSH..."
yay -S openssh

echo "Checking if SSH is configured..."
if [ ! -d ~/.ssh ]; then
	echo "Creating a new SSH key pair..."
	ssh-keygen -t ed25519
fi

echo "Installing i3..."
yay -S i3-wm

echo "Installing Rofi for i3..."
yay -S rofi

echo "Installing the \"xorg-xinit\" package for i3..."
yay -S xorg-xinit

echo "Installing the \"xorg-server\" package for i3..."
yay -S xorg-server
