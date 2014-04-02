#!/bin/bash

#export PS1="\h:\W \u\$"
#export PS1="\u:\w> "

export PS1="\u:\W$ "

## For Emacs
export EDITOR=~/Scripts/edit
#ec() {
#    emacsclient -n $1
#}

# Print working directory after a cd.
cd() {
    if [[ $@ == '-' ]]; then
        builtin cd "$@" > /dev/null  # We'll handle pwd.
    else
        builtin cd "$@"
    fi
    echo -e "   \033[1;30m"`pwd`"\033[0m"
}

# Let you do simple calculation in shell, Usecase: calc 2*3 + 5/2
#calc() {
#    echo “scale=3;$@” | bc -l
#}

# Extract all things! Usecase: extract foo.gz or extract archive.tar.bz2
extract() {
    local c e i
    (($#)) || return
    for i; do
        c=”
        e=1
        if [[ ! -r $i ]]; then
            echo “$0: file is unreadable: \`$i’” >&2
            continue
        fi
#        case $i in
#            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz))))
#                   c=’bsdtar xvf’;;
#            *.7z)  c=’7z x’;;
#            *.Z)   c=’uncompress’;;
#            *.bz2) c=’bunzip2′;;
#            *.exe) c=’cabextract’;;
#            *.gz)  c=’gunzip’;;
#            *.rar) c=’unrar x’;;
#            *.xz)  c=’unxz’;;
#            *.zip) c=’unzip’;;
#            *)     echo “$0: unrecognized file extension: \`$i’” >&2
#                   continue;;
#        esac
#        command $c “$i”
#        e=$?
    done
    return $e
}



### For grep coloring ####
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' # Regular
#export GREP_COLOR='7;32' # Invert color (set background) (Green)
#export GREP_COLOR='5;32' # Blinking (Green)

# For DistCC

#export DISTCC_HOSTS='localhost JiPro.local'


#
# Your previous .profile  (if any) is saved as .profile.mpsaved
# Setting the path for MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

PATH=$PATH:~/Scripts:~/Scripts/GitScripts:~/Projects/Work/Mapiton/Native/Pigsty/MacOSX
export PATH


fortunePath=`which fortune`
if [ ! -z $fortunePath ] ; then
	echo ""
	echo "-----------"
	fortune
	echo "-----------"
	echo ""
fi


## Working with history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend



#
# export SURFRAW_graphical=no
# export SURFRAW_browser=/opt/local/bin/w3m
# export SURFRAW_text_browser=/opt/local/bin/w3m
# export SURFRAW_graphical_browser=/Applications/Firefox.app/Contents/MacOS/firefox-bin
# export SURFRAW_graphical_remote=yes
#


# use the up/down keys to cycle through a list of commands starting with the given letters
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

export ALTERNATE_EDITOR=""
