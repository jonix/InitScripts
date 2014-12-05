
### General aliases

# A coloured ls
alias l='ls -lFGh'

# A ls that only lists directories
alias lsd='ls -lF |grep /'

# A ls that lists hidden files
alias lsh='ls -lFGA'

# A ls that never prints colors
alias lsn="ls -lF --color=never"

# A filtered ls
alias lq='${HOME}/Scripts/lq.sh'


### an alias to make make make builds faster (it's not a typo and no pun intended)
alias build="make -j3"
alias rebuild="make clean && make -j3"

### Various git shotcuts
alias gb="git branch |grep -v __merged"

alias baz='bzr'

### Coloured less/cat
alias cless='vim -u /usr/share/vim/vim72/macros/less.vim'
alias ccat='vim -u /usr/share/vim/vim72/macros/less.vim'


### In Bash change directory to the same active buffer in Emacs
### URL: http://www.reddit.com/r/emacs/comments/hd3jm/from_my_bashrc_jump_to_emacss_current_directory/

#alias jm='eval cd $(....)'
alias jm='eval cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) default-directory)" | '"sed -E 's/(^\")|(\"$)//g')"

# For Mac OS
#alias jm='cd $(emacsclient -e "(with-current-buffer (window-buffer (frame-selected-window)) (expand-file-name default-directory))" | '"sed -E 's/(^\")|(\"$)//g')"

# For compiling pdf files from latex
alias pdfc='pdflatex -file-line-error -halt-on-error -output-directory /home/jonix/Temp/pdfc'