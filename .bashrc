# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias vi=vim
alias UPDATE='sudo pacman -Syu --noconfirm'
EDITOR=vim
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

# open the default application from the command line
function open () {
  xdg-open "$@">/dev/null 2>&1
}

# run neofetch if it's installed
if [ -x "$(command -v neofetch)" ]; then
  neofetch
fi
