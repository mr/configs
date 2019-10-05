#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH=$HOME/.bin:$HOME/.local/bin:$HOME/.cabal/bin:~/.local/bin:$HOME/.cargo/bin:$PATH
export EDITOR=$(which nvim)

eval $(dircolors)
export LS_COLORS=`echo $LS_COLORS|sed 's/34\;42/94/g'`
if [ -f "/usr/java/latest" ]; then
    export JAVA_HOME="/usr/java/latest"
fi

alias weechat=weechat-curses

function findbin () {
    if [ "$1" != "" ]; then
        pacman -Ql $1 | grep 'bin.*[^/]$' | awk '{print $2}'
    else
        echo "Usage: findbin <search term>"
    fi
}
bindkey -v
export KEYTIMEOUT=1
bindkey -M vicmd '?' history-incremental-search-forward
bindkey -M vicmd '/' history-incremental-search-backward

# Most important function
function ayy_lmao() {
    echo "░░░░░░▄▀▒▒▒▒░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒█"
    echo "░░░░█▒▒▄▀▀▀▀▀▄▄▒▒▒▒▒▒▒▒▒▄▄▀▀▀▀▀▀▄"
    echo "░░▄▀▒▒▒▄█████▄▒█▒▒▒▒▒▒▒█▒▄█████▄▒█"
    echo "░█▒▒▒▒▐███████▌▌▒█▒▒▒▒▒█▒▐██████▌▒█"
    echo "▀▒▒▒▒▒▒▀█████▀▒▒█▒░▄▒▄█▒▒▀█████▀▒▒▒█"
    echo "▒▒▐▒▒▒░░░░▒▒▒▒▒█▒░▒▒▀▒▒█▒▒▒▒▒▒▒▒▒▒▒▒█"
    echo "▒▌▒▒▒░░░▒▒▒▒▒▄▀▒░▒▄█▄█▄▒▀▄▒▒▒▒▒▒▒▒▒▒▒▌"
    echo "▒▌▒▒▒▒░▒▒▒▒▒▒▀▄▒▒█▌▌▌▌▌█▄▀▒▒▒▒▒▒▒▒▒▒▒▐"
    echo "▒▐▒▒▒▒▒▒▒▒▒▒▒▒▒▌▒▒▀███▀▒▌▒▒▒▒▒▒▒▒▒▒▒▒▌"
    echo "▀▀▄▒▒▒▒▒▒▒▒▒▒▒▌▒▒▒▒▒▒▒▒▒▐▒▒▒▒▒▒▒▒▒▒▒█"
    echo "▀▄▒▀▄▒▒▒▒▒▒▒▒▐▒▒▒▒▒▒▒▒▒▄▄▄▄▒▒▒▒▒▒▄▄▀"
    echo "▒▒▀▄▒▀▄▀▀▀▄▀▀▀▀▄▄▄▄▄▄▄▀░░░░▀▀▀▀▀▀"
    echo "▒▒▒▒▀▄▐▒▒▒▒▒▒▒▒▒▒▒▒▒▐"
    echo "░▄▄▄░░▄░░▄░▄░░▄░░▄░░░░▄▄░▄▄░░░▄▄▄░░░▄▄▄"
    echo "█▄▄▄█░█▄▄█░█▄▄█░░█░░░█░░█░░█░█▄▄▄█░█░░░█"
    echo "█░░░█░░█░░░░█░░░░█░░░█░░█░░█░█░░░█░█░░░█"
    echo "▀░░░▀░░▀░░░░▀░░░░▀▀▀░░░░░░░░░▀░░░▀░▀▄▄▄▀"
}

alias weechat=weechat-curses
alias ghist="git --no-pager log --color=always --oneline | head"
alias ghistg="git --no-pager log --color=always --oneline --graph | head"
alias bat="watch -n 1 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'"
alias note="vim -u /home/mattro/.noterc /home/mattro/Documents/notes/$(date +%m-%d-%Y)"

#export NVM_DIR="/home/mattro/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
