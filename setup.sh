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

echo "Configuring i3..."
mkdir -p ~/.i3/config
cp $(dirname $0)/assets/.i3/config ~/.i3/config
mkdir -p ~/.i3/scripts
cp $(dirname $0)/assets/decrease-brightness.sh ~/.i3/scripts/decrease-brightness.sh
cp $(dirname $0)/assets/increase-brightness.sh ~/.i3/scripts/increase-brightness.sh
cp $(dirname $0)/assets/.xinitrc ~/.xinitrc
i3-msg reload

echo "Installing Visual Studio Code..."
yay -S visual-studio-code-bin

echo "Setting Visual Studio Code as the text editor for Git..."
git config --global core.editor "code --wait"

echo "Installing Google Chrome..."
yay -S google-chrome

echo "Installing GIMP..."
yay -S gimp

echo "Installing the \"net-tools\" package..."
yay -S net-tools

echo "Installing Less..."
yay -S less
