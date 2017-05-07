# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jilani"
DISABLE_AUTO_UPDATE=true # disables ZSH autoupdate

plugins=(git osx autojump)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/alias.sh
source ~/.dotfiles/z.sh
source ~/.dotfiles/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# It will enable to use cd -1, cd -2 to go back to previous folders
setopt AUTO_PUSHD

# It will do a ls after a cd
function chpwd() {
    emulate -L zsh
    ls
}
