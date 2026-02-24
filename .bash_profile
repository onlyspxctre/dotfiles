unset HISTFILE

# PS1
export PS1="\[\e[38;5;165m\]\u\[\e[38;5;171m\]@\[\e[38;5;213m\]\h \[\e[38;5;219m\]\w \[\e[38;5;220m\]$ \[\033[0m\]"

# Editor
export VISUAL=nvim
export EDITOR=$VISUAL

# Qt Rice
export QT_QPA_PLATFORMTHEME=qt6ct

# Aliases
alias ls='ls --color=always'
alias la='ls -a'
alias ll='ls -la'
alias l='ls -lah'
alias grep='grep --color=always'
alias less='less -R'
alias pacman='pacman --color=always'
alias paru='paru --color=always'

alias neofetch='fastfetch'
alias vim=nvim
alias vi=vim

# PATH
export PATH=$HOME/.bun/bin:$HOME/.local/bin:$PATH
