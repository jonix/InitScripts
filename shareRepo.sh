#!/bin/bash

if [ -d .git ] ; then
    if [ -f git-daemon-export-ok ] ; then
	git daemon --base-path=. --verbose --export-all
        exit 0
    fi
fi

echo "You must start this script from Mapitons root folder"
exit 1

# Clone this repository by
#    git clone git://jonixmb/ Mapiton
#
# jonixmb is defined in /etc/hosts pointing to the Macbook
# and this setting must be defined in the client machine
# various problem when I tried to clone git repos with ip address,
#
