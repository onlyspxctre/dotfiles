source ~/.bash_profile

export PS1="\[\033[1;36m\]\u\[\033[0;37m\]@\[\033[1;96m\]\h \[\033[0;35m\]\w \[\033[33m\]$ \[\033[0m\]"

alias ls='ls --color=always'
alias la='ls -a'
alias ll='ls -la'
alias l='ll'
alias grep='grep --color=always'
alias less='less -R'
alias pacman='pacman --color=always'
alias paru='paru --color=always'

alias neofetch='fastfetch'
