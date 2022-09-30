# Update pacman

pacman -Syyu --noconfirm

# Install all required programs from list

cat archlist.txt | xargs pacman -S --noconfirm

## UFW

ufw enable
ufw default deny incoming
ufw default allow outgoing

## Cups

systemctl enable cups.service
systemctl start cups.service

## Bluetooth

systemctl enable bluetooth.service
systemctl start bluetooth.service

## Finder Script

cp scripts/fzfinder.sh /usr/local/bin/fzfinder
chmod +x /usr/local/bin/fzfinder
