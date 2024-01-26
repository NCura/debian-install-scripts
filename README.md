# debian-install-scripts

- Do an expert installation
    - Use LVM
    - Don't use SWAP
- Install Nala: 
```bash
  sudo apt install nala
  nala fetch
```
- Update && Upgrade
```bash
  sudo nala update && sudo nala upgrade
```
- Install git
```bash
  sudo nala install git
```
- Clone repos
```bash
  mkdir -p ~/.local/share/ncura
  cd ~/.local/share/ncura
  git clone https://github.com/NCura/dotfiles
  git clone https://github.com/NCura/debian-install-scripts
```
- Handle dotfiles
```bash
  cd ~/.local/share/ncura/dotfiles
  cat .bashrc > ~/.bashrc
  cp .bashrc ~/
  cp -r .config ~/
  mkdir ~/.local/bin
  cp .local/bin/* ~/.local/bin/
  mkdir ~/.local/share/wallpapers
  cp .local/share/wallpapers/* ~/.local/share/wallpapers/
```
- Handle debian-install-scripts
```bash
  cd ~/.local/share/ncura/debian-install-scripts
  ./common-packages.sh
  ./qtile.sh
  ./zram.sh
  ./flatpak.sh
  ./nvidia.sh
  reboot
```

- After reboot:
```bash
  cd ~/.local/share/ncura/debian-install-scripts
  ./flatpak-packages.sh
```
