# debian-install-scripts

- Do an expert installation
    - Use LVM
    - Don't use SWAP
 
- Add root privilegies to user
```bash
  nano /etc/sudoers
  # username ALL=(ALL:ALL) ALL
```
- Enable autologin (optional)
```bash
  sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
  sudo nano /etc/systemd/system/getty@tty1.service.d/override.conf

  # Add the following lines to the file:
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty --autologin nicolas --noclear %I $TERM
  Type=idle

  sudo systemctl daemon-reload
  sudo systemctl restart getty@tty1
```
- Install Nala: 
```bash
  sudo apt install nala
  sudo nala fetch
```
- Update && Upgrade
```bash
  sudo nala upgrade -yy
```
- Install git
```bash
  sudo nala install git -yy
```
- Configure dotfiles and execute install scripts
```bash
  mkdir -p ~/.local/share/ncura
  cd ~/.local/share/ncura

  # Use SSH
  git clone git@github.com:NCura/dotfiles.git
  git clone git@github.com:NCura/debian-install-scripts.git

  # Use HTTPS
  git clone https://github.com/NCura/dotfiles
  git clone https://github.com/NCura/debian-install-scripts

  cd ~/.local/share/ncura/debian-install-scripts
  ./setup-dotfiles.sh
  ./install-all.sh
```

- After reboot:
```bash
  cd ~/.local/share/ncura/debian-install-scripts
  ./flatpak-packages.sh
```
