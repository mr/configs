ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/bin/vim

ZSH_THEME="blinks"
plugins=(git cabal)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.bin:$HOME/.cabal/bin:~/.local/bin:$HOME/.cargo/bin:$PATH

eval $(dircolors)
export LS_COLORS=`echo $LS_COLORS|sed 's/34\;42/94/g'`
if [ -f "/usr/java/latest" ]; then
    export JAVA_HOME="/usr/java/latest"
fi

alias weechat=weechat-curses
alias tmux="tmux -2"

function findbin () {
    if [ "$1" != "" ]; then
        pacman -Ql $1 | grep 'bin.*[^/]$' | awk '{print $2}'
    else
        echo "Usage: findbin <search term>"
    fi
}
bindkey -v
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
bindkey "^?" backward-delete-char

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
alias tmux="tmux -2"
alias ghist="git --no-pager log --color=always --oneline | head"
alias ghistg="git --no-pager log --color=always --oneline --graph | head"
alias bat="watch -n 1 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'"
alias note="vim -u /home/mattro/.noterc /home/mattro/Documents/notes/$(date +%m-%d-%Y)"

#export NVM_DIR="/home/mattro/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
