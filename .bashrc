[[ $- != *i* ]] && return

set -o vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi=vim
alias UPDATE='sudo pacman -Syu --noconfirm'

HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000
shopt -s histappend

# Functions

# mkcd newdir
function mkcd () {
  mkdir -p -- "$1" && cd -P -- "$1"
}

function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

# what branch am I on?
function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}
