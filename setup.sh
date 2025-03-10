#!/bin/sh
echo "Updating what's currently installed using Pacman..."
sudo pacman --sync --refresh --sysupgrade

echo "Installing Git..."
sudo pacman --sync --needed git

echo "Checking if the Git user name is set..."
if [ -z "$(git config --global user.name)" ]; then
	read -p "Enter your Git user name: " GIT_USER_NAME
	echo "Setting the Git user name..."
	git config --global user.name "$GIT_USER_NAME"
fi

echo "Checking if the Git user email address is set..."
if [ -z "$(git config --global user.email)" ]; then
	read -p "Enter your Git user email address: " GIT_USER_EMAIL_ADDRESS
	echo "Setting the Git user email address..."
	git config --global user.email "$GIT_USER_EMAIL_ADDRESS"
fi

echo "Checking if Yay is installed..."
if ! command -v yay &> /dev/null; then
	echo "Installing the \"base-devel\" package for Yay..."
	sudo pacman --sync --needed base-devel
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
yay --sync --refresh --sysupgrade

echo "Installing OpenSSH..."
yay --sync --needed openssh

echo "Checking if SSH is configured..."
if [ ! -d ~/.ssh ]; then
	echo "Creating a new SSH key pair..."
	ssh-keygen -t ed25519
fi

echo "Installing i3..."
yay --sync --needed i3-wm

echo "Installing Rofi for i3..."
yay --sync --needed rofi

echo "Installing the \"xorg-xinit\" package for i3..."
yay --sync --needed xorg-xinit

echo "Installing Deno..."
yay --sync --needed deno

echo "Configuring i3..."
mkdir -p ~/.config/i3
rm -rf ~/.config/i3/bar
cp -r $(dirname $0)/assets/.config/i3/bar ~/.config/i3/bar
cp $(dirname $0)/assets/.config/i3/config ~/.config/i3/config
mkdir -p ~/.config/i3/scripts
cp $(dirname $0)/assets/.config/i3/scripts/decrease-brightness.sh ~/.config/i3/scripts/decrease-brightness.sh
cp $(dirname $0)/assets/.config/i3/scripts/decrease-volume.sh ~/.config/i3/scripts/decrease-volume.sh
cp $(dirname $0)/assets/.config/i3/scripts/increase-brightness.sh ~/.config/i3/scripts/increase-brightness.sh
cp $(dirname $0)/assets/.config/i3/scripts/increase-volume.sh ~/.config/i3/scripts/increase-volume.sh
cp $(dirname $0)/assets/.config/i3/scripts/mute-volume.sh ~/.config/i3/scripts/mute-volume.sh
i3-msg restart

echo "Configuring xinit..."
cp $(dirname $0)/assets/.xinitrc ~/.xinitrc

echo "Installing Visual Studio Code..."
yay --sync --needed visual-studio-code-bin

echo "Setting Visual Studio Code as the text editor for Git..."
git config --global core.editor "code --wait"

echo "Installing Google Chrome..."
yay --sync --needed google-chrome

echo "Installing GIMP..."
yay --sync --needed gimp

echo "Installing the \"net-tools\" package..."
yay --sync --needed net-tools

echo "Installing Less..."
yay --sync --needed less

echo "Installing Ark..."
yay --sync --needed ark

echo "Installing Thunar..."
yay --sync --needed thunar

echo "Installing Termite..."
yay --sync --needed termite

echo "Installing the \"noto-fonts-emoji\" package..."
yay --sync --needed noto-fonts-emoji

echo "Installing Spectacle"
yay --sync --needed spectacle

echo "Configuring Bash..."
cp $(dirname $0)/assets/.bashrc ~/.bashrc
cp $(dirname $0)/assets/.bash_profile ~/.bash_profile
cp $(dirname $0)/assets/.bash_logout ~/.bash_logout

echo "Configuring Thunar..."
mkdir -p ~/.config/xfce4
cp $(dirname $0)/assets/.config/xfce4/helpers.rc ~/.config/xfce4/helpers.rc

echo "Installing Greenclip..."
yay --sync --needed greenclip

echo "Configuring Greenclip..."
cp $(dirname $0)/assets/.config/greenclip.toml ~/.config/greenclip.toml
