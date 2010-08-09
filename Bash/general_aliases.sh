
### General aliases

# A coloured ls
alias l='ls -lFG'

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
