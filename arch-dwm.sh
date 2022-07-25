#!/bin/bash


# Install packages
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot nitrogen picom zsh zsh-completions alacritty ranger thunar exa breeze-gtk alsa-utils pamixer playerctl xf86-video-intel ntfs-3g openssh micro xclip

# Install fonts
sudo pacman -S --noconfirm ttf-jetbrains-mono ttf-font-awesome ttf-indic-otf

# DWM
mkdir .suckless
cd .suckless
repos=( "dmenu" "slstatus" "dwm" "slock" )
for repo in ${repos[@]}
do
    git clone https://github.com/rahulsenna/$repo.git
    cd $repo;make;sudo make install;cd ..
done
cd ..


# Yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay;makepkg -si;cd ..

# Sublime Text
sudo pacman -Syu haveged
sudo systemctl start haveged
sudo systemctl enable haveged
sudo rm -fr /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux


curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text

sudo pacman -S python-pip
pip install pynput

# Google Chrome
yay -S google-chrome

# Clion
yay -S clion-jre
yay -S clion
yay -S clion-lldb
yay -S apple-fonts
yay -S openvpn3

sudo chmod +x ~/.dotfiles/link
./~/.dotfiles/link

# Intel GFX tearing fix

sudo cp ~/.dotfiles/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf
sudo cp ~/.dotfiles/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

# Change shell to Zsh
chsh -s /bin/zsh
