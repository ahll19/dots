#!/bin/bash
# TODO: move most of this to premade zshrc file
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
echo 'source <(fzf --zsh)'