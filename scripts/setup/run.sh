sudo pacman -Syu
pacman -S base-devel
pacman -S git

if ! git config --global --get user.name >/dev/null; then
    read -p "Enter your git user.name: " GIT_USER_NAME
    git config --global user.name "$GIT_USER_NAME"
fi

if ! git config --global --get user.email >/dev/null; then
    read -p "Enter your git user.email: " GIT_USER_EMAIL
    git config --global user.email "$GIT_USER_EMAIL"
fi

CURRENT_WORKING_DIRECTORY=$(pwd)
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si
cd $CURRENT_WORKING_DIRECTORY
rm -rf /tmp/yay
yay -Syu
yay -S noto-fonts
yay -S i3-wm
yay -S openssh
ssh-keygen
sudo cp $(dirname $0)/configs/backlight.rules /etc/udev/rules.d/backlight.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo usermod -aG video $USER
cp $(dirname $0)/configs/decrease-brightness.sh ~/.i3/scripts/decrease-brightness.sh
cp $(dirname $0)/configs/increase-brightness.sh ~/.i3/scripts/increase-brightness.sh
cp $(dirname $0)/configs/i3-config ~/.i3/config
yay -S rofi
