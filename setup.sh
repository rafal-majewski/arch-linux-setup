#!/bin/sh
echo "Updating what is currently installed using Pacman..."
sudo pacman --sync --refresh --sysupgrade
echo "Installing Git..."
sudo pacman --sync --needed git
echo "Checking if the Git user name is set..."
if [ -z "$(git config --global user.name)" ]; then
	read -p "Enter your Git user name: " GIT_USER_NAME
	echo "Setting the Git user name..."
	git config --global user.name "${GIT_USER_NAME}"
fi
echo "Checking if the Git user email address is set..."
if [ -z "$(git config --global user.email)" ]; then
	read -p "Enter your Git user email address: " GIT_USER_EMAIL_ADDRESS
	echo "Setting the Git user email address..."
	git config --global user.email "${GIT_USER_EMAIL_ADDRESS}"
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
	cd "${CURRENT_WORKING_DIRECTORY_PATH}"
	rm -rf /tmp/yay
fi
echo "Updating what is currently installed using Yay..."
yay --sync --refresh --sysupgrade
echo "Installing OpenSSH..."
yay --sync --needed openssh
echo "Checking if SSH is configured..."
if [ ! -d "${HOME}/.ssh" ]; then
	echo "Creating a new SSH key pair..."
	ssh-keygen -t ed25519
fi
echo "Installing i3..."
yay --sync --needed i3-wm
echo "Installing rsync..."
yay --sync --needed rsync
echo "Allowing for brightness control without sudo..."
cp "$(dirname "${0}")/assets/rules.d/90-backlight.rules" /etc/udev/rules.d/90-backlight.rules
sudo udevadm control --reload
sudo udevadm trigger
sudo usermod -aG video "${USER}"
echo "Installing Deno for i3..."
yay --sync --needed deno
echo "Installing Rofi for i3..."
yay --sync --needed rofi
echo "Installing the \"xorg-server\" package for i3..."
yay --sync --needed xorg-server
echo "Installing the \"xorg-xinit\" package for i3..."
yay --sync --needed xorg-xinit
echo "Configuring i3..."
rsync --archive --delete "$(dirname "${0}")/assets/.config/i3/" "${HOME}/.config/i3/"
i3-msg restart
echo "Configuring xinit..."
cp "$(dirname "${0}")/assets/.xinitrc" "${HOME}/.xinitrc"
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
echo "Installing Termite..."
yay --sync --needed termite
echo "Installing Thunar..."
yay --sync --needed thunar
echo "Configuring Thunar..."
mkdir -p "${HOME}/.config/xfce4"
cp "$(dirname "${0}")/assets/.config/xfce4/helpers.rc" "${HOME}/.config/xfce4/helpers.rc"
echo "Configuring Bash..."
cp "$(dirname "${0}")/assets/.bashrc" "${HOME}/.bashrc"
cp "$(dirname "${0}")/assets/.bash_profile" "${HOME}/.bash_profile"
cp "$(dirname "${0}")/assets/.bash_logout" "${HOME}/.bash_logout"
echo "Installing the \"noto-fonts-emoji\" package..."
yay --sync --needed noto-fonts-emoji
echo "Installing Spectacle"
yay --sync --needed spectacle
echo "Installing Greenclip..."
yay --sync --needed rofi-greenclip
echo "Configuring Greenclip..."
cp "$(dirname "${0}")/assets/.config/greenclip.toml" "${HOME}/.config/greenclip.toml"
echo "Installing autorandr..."
yay --sync --needed autorandr
echo "Configuring Docker..."
sudo systemctl enable docker.service
echo "Starting Docker..."
sudo systemctl start docker.service
echo "Setting the default keyboard layout for X sessions..."
sudo cp "$(dirname "${0}")/assets/xorg.conf.d/00-keyboard.conf" /etc/X11/xorg.conf.d/00-keyboard.conf
echo "Setting the keyboard layout for the current X session..."
setxkbmap -layout pl -model pc105 -variant basic
