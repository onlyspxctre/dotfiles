path+=($HOME'/.local/bin')

## Bun
path+=($HOME'/.bun/bin')

path+=($HOME'/devel/bin/zig-x86_64-linux-0.15.1/')

## Vim: default editor
export VISUAL=vim
export EDITOR=$VISUAL

alias ls='ls --color=always'
alias la='ls -lah --color=always'
alias ll='la'
alias l='la'
alias grep='grep --color=always'
alias less='less -R'
alias pacman='pacman --color=always'
alias paru='paru --color=always'
alias yay='paru'

alias neofetch='fastfetch'
