#!/bin/bash
sudo pacman -S zellij gitui stow bat fzf zsh rustup pyenv --noconfirm
yay -S visual-studio-code-bin pyenv-virtualenv --noconfirm
rustup default stable