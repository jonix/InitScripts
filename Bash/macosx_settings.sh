#!/bin/bash

#### Mac OS X specifc Bash settings ###

echo "Loading Mac OS X specific settings"

#export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"
#export PATH=/usr/local/mysql/bin:/Applications/MAMP/bin/php5/bin:$PATH:/Users/Jonix/Projects/Work/TopSecret/Mapiton/Native/Pigsty/MacOSX:/Users/Jonix/Scripts:

PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/Applications/Emacs.app/Contents/MacOS:/Applications/Emacs.app/Contents/MacOS/bin
PATH=$PATH:~/Applications/bin:
export PATH

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/Applications/lib:

export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"

export EDITOR="/usr/bin/mate --wait --change-dir"

#export CC=/usr/bin/gcc-4.2
#export CPP=/usr/bin/cpp-4.2
#export CXX=/usr/bin/g++-4.2
#export CXXCPP=/usr/bin/c++-4.2
