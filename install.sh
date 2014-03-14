
# Creating the aliases
ln -s ~/.dotfiles/bin ~/bin
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore ~/.gitignore

# Installing the theme
cp ~/.dotfiles/zsh/themes/dantas.zsh-theme ~/.oh-my-zsh/themes

# Installing fasd for 'z' and 'zz' commands
brew install fasd

# Installing autojump for 'j' command
brew install autojump