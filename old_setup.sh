# ===========================================
# Directory structure and other stuff
# ===========================================
cd /home/anders
mkdir -p Git
mkdir -p .zsh
# ===========================================


# ===========================================
# INSTALL
# ===========================================
yay

# Sway
sudo pacman -S alacritty sway swaylock swayidle swaybg

# TUI apps
sudo pacman -S zellij gitui

# GUI apps
yay -S spotify visual-studio-code-bin
sudo pacman -S libreoffice-fresh chromium vlc qbittorrent gimp

# CLI tools
sudo pacman -S stow bat fzf zsh

# System theming
sudo pacman -S nwg-look

# Software 
sudo pacman -S rustup pyenv
yay -S pyenv-virtualenv
rustup default stable
# ===========================================


# ===========================================
# Git and Stow configs
# ===========================================
cd ~/Git

# Cloning to git dir
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git catpuccin-syntax-highlight-zsh

cd /home/anders
# ===========================================


# ===========================================
# Shell setup
# ===========================================
chsh -s /bin/zsh
homectl update --shell=/bin/zsh anders
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd Git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
cd ~/Git/catpuccin-syntax-highlight-zsh/themes/
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
echo "source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
# ===========================================


# ===========================================
# Notes
# ===========================================
# to figure out
#   wireplumber
#   dmenu
#   GUIs for wifi and bluetooth
#   screenshotting
#   set up autostart
#     dunst (notification manager)
#     polkit-kde-agent (authentication agent)
#   make script modular
#   pyenv autocomplete
#   switch to alacritty instead of kitty (since it is rust based)
# To config
#   hyprland
#   kitty (catpuccin and general config)
#   neovim
#   https://github.com/catppuccin/catppuccin?tab=readme-ov-file
#   https://github.com/hyprland-community/awesome-hyprland
#   https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway
#   https://wiki.hyprland.org/Useful-Utilities/
#   https://wiki.hyprland.org/Configuring/Configuring-Hyprland/
#   https://www.youtube.com/shorts/iGxpTdy6b-Y
# ===========================================
