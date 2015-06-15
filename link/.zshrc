# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/bin/vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git cabal)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:$HOME/.bin:$HOME/.cabal/bin

eval $(dircolors)
export LS_COLORS=`echo $LS_COLORS|sed 's/34\;42/94/g'`
if [ -f "/usr/java/latest" ]; then
    export JAVA_HOME="/usr/java/latest"
fi

alias weechat=weechat-curses
alias tmux="tmux -2"
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
