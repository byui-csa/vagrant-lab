# time
timedatectl set-timezone America/Boise

# headers (required for shared clipboard)
apt install -y linux-headers-$(uname -r)

# wallpaper
rm /usr/share/backgrounds/kali-16x9/default
ln -s /usr/share/backgrounds/kali-16x9/kali-glitchsea.jpg /usr/share/backgrounds/kali-16x9/default
