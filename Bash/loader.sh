#### Base skeleton for a modularized bash shell customization loading file

## Loading general customization

if [ -f ~/.InitScripts/Bash/general_settings.sh ] ; then
	. ~/.InitScripts/Bash/general_settings.sh
else
	echo "Did not load general settings"
fi


if [ -f ~/.InitScripts/Bash/general_aliases.sh ] ; then
	echo "Loading general aliases"
	. ~/.InitScripts/Bash/general_aliases.sh
else
	echo "Did not load general aliases"
fi

if [ -f ~/.InitScripts/Bash/general_shortcuts.sh ] ; then
	echo "Loading general shortcuts"
	. ~/.InitScripts/Bash/general_shortcuts.sh
else
	echo "Did not load general shortcuts"
fi


### SSH command line shortcuts ###

if [ -f ~/.InitScripts/Bash/ssh_shortcuts.sh ] ; then
	echo "Loading SSH shortcuts"
	. ~/.InitScripts/Bash/ssh_shortcuts.sh
else
	echo "Did not load SSH shortcuts"
fi


### OS specific settings ###

if [ `uname` == "Linux" ] ; then
	if [ -f ~/.InitScripts/Bash/linux_settings.sh ] ; then
		. ~/.InitScripts/Bash/linux_settings.sh
	else
		echo "No Linux specific settings file found"
	fi

	if [ -f ~/.InitScripts/Bash/linux_alias.sh ] ; then
	   . ~/.InitScripts/Bash/linux_alias.sh
	else
		echo "No Linux specific aliases found"
	fi
elif [ `uname` == "Darwin" ] ; then
	if [ -f ~/.InitScripts/Bash/macosx_settings.sh ] ; then
		. ~/.InitScripts/Bash/macosx_settings.sh
	else
		echo "No Mac OS X specific settings file found"
	fi

	if [ -f ~/.InitScripts/Bash/macosx_alias.sh ] ; then
	   . ~/.InitScripts/Bash/macosx_alias.sh
	else
		echo "No Mac OS X specific aliases found"
	fi
else
	echo "Unknown OS, does not load any OS specific settings"
fi


### OS specific shortcuts ###


#### Project specific customization

## For the Mapiton project
if [ -f ~/.InitScripts/Bash/mapiton_shortcuts.sh ] ; then
	echo "Loading mapiton shortcuts"
	. ~/.InitScripts/Bash/mapiton_shortcuts.sh
else
	echo "Did not load mapiton shortcuts"
fi

## For the Gallery Monkey project
if [ -f ~/.InitScripts/Bash/gallery_monkey_shortcuts.sh ] ; then
	echo "Loading Gallery Monkey shortcuts"
	. ~/.InitScripts/Bash/gallery_monkey_shortcuts.sh
else
	echo "Did not load Gallery Monkey shortcuts"
fi

## For the Crenna.se project
#if [ -f ~/.InitScripts/Bash/crenna_shortcuts.sh ] ; then
#	echo "Loading Crenna.se shortcuts"
#	. ~/.InitScripts/Bash/crenna_shortcuts.sh
#else
#	echo "Did not load Crenna shortcuts"
#fi

## For the CycoreFx Website FS on local machine
if [ -f ~/.InitScripts/Bash/ccfx_website_shortcuts.sh ] ; then
	echo "Loading ccfx website shortcuts"
	. ~/.InitScripts/Bash/ccfx_website_shortcuts.sh
else
	echo "Did not loadccfx website shortcuts"
fi

## For navigating to Studier folder on local machine
if [ -f ~/.InitScripts/Bash/studies_shortcuts.sh ] ; then
	echo "Loading Studies shortcuts"
	. ~/.InitScripts/Bash/studies_shortcuts.sh
else
	echo "Did not load Studies shortcuts"
fi



echo ""
echo ""
