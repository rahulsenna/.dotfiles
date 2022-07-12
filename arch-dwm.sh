#!/bin/bash


# Install packages
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot chromium nitrogen picom zsh zsh-completions alacritty ranger pcmanfm exa breeze-gtk alsa-utils pamixer playerctl pulseaudio

# Install fonts
sudo pacman -S --noconfirm ttf-jetbrains-mono ttf-font-awesome

# DWM
mkdir .suckless
cd .suckless;
repos=( "dmenu" "dwmstatus" "st" "slock" )
for repo in ${repos[@]}
do
    git clone git://git.suckless.org/$repo
    cd $repo;make;sudo make install;cd ..
done

git clone https://github.com/rahulsenna/dwm.git
cd dwm;make;sudo make install;cd ..


# Change shell to Zsh
chsh -s /bin/zsh

./link

# Yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay;makepkg -si;cd ..

#SublimeText
sudo pacman -Syu haveged
sudo systemctl start haveged
sudo systemctl enable haveged
sudo rm -fr /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux


curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text