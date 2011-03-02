### Mapiton shortcuts ###

MAPITON_PATH="${HOME}/Projects/Work/Mapiton"

if [ `uname` == "Linux" ] ; then
	alias pigsty='cd ${MAPITON_PATH}/Native/Pigsty/Linux'
	alias libs='cd ${MAPITON_PATH}/Native/Libs/Libs/Linux'
elif [ `uname` == "Darwin" ] ; then
	alias pigsty='cd ${MAPITON_PATH}/Native/Pigsty/MacOSX'
	alias libs='cd ${MAPITON_PATH}/Native/Libs/Libs/OSX'
else
	echo "Unknown OS, does not load any OS specific settings"
fi



alias mapiton='cd ${MAPITON_PATH}'
alias native='cd ${MAPITON_PATH}/Native/Source'
alias functests='cd ${MAPITON_PATH}/Native/FunctionalTests/'
alias sharedsrc='cd ${MAPITON_PATH}/Native/Source/SharedSource/CommonSource'

alias rpig='cd ${MAPITON_PATH}/Native/Source/RenderPig/Source/CommonSource'
alias pigerrors='cd ${MAPITON_PATH}/Native/Source/RenderPig/Resources/ErrorInclusion'
alias pigtests='cd ${MAPITON_PATH}/Native/Source/RenderPig/TestRuns'

alias lhog='cd ${MAPITON_PATH}/Native/Source/LicenseHog/Source/CommonSource'
alias hogerrors='cd ${MAPITON_PATH}/Native/Source/LicenseHog/Resources/ErrorInclusion'
alias hogtests='cd ${MAPITON_PATH}/Native/Source/LicenseHog/TestRuns'

alias lcreator='cd ${MAPITON_PATH}/Native/Source/LicenseCreator/Source/CommonSource'

alias wboar='cd ${MAPITON_PATH}/Native/Source/Watchboar/Source/CommonSource'

# Expermintal projects
alias swine='cd ${MAPITON_PATH}/Native/Source/StudioSwine/Source/CommonSource'
alias textpig='cd ${MAPITON_PATH}/Native/Source/Experimental/TextPig/Source/CommonSource'
alias imgcrunch='cd ${MAPITON_PATH}/Native/Source/Experimental/ImageCruncher/Source/CommonSource'

