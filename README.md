# Instalation

Clone the project:

    git clone git@github.com:celsodantas/dotfiles.git ~/.dotfiles

Now create symlinks to it:

    ln -s ~/.dotfiles/bin ~/bin
    ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

Now copy the theme under the `~/.dotfiles/zsh/themes/dantas.zsh-theme` to `~/.oh-my-zsh/themes`.

    cp ~/.dotfiles/zsh/themes/dantas.zsh-theme ~/.oh-my-zsh/themes

# Mac OS changes

Enable the key repetition on hold (need to restart the Mac):

    defaults write -g ApplePressAndHoldEnabled -bool false


enjoy

