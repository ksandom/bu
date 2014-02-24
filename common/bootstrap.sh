# Get bu going

function require
{
	requireItem="$1"
	
	# Include config or functionality
	if [ -e "$BUHOME/$requireItem" ]; then
		. "$BUHOME/$requireItem"
	else
		echo "$0 require: Could not find \"$BUHOME/$requireItem\"" >&2
		exit 1
	fi
}

function requireConfig
{
	configItem="$1"
	
	if [ "${!configItem}" == '' ]; then
		echo "$0 requireConfig: Could not find config item \"$configItem\". See https://github.com/ksandom/bu/blob/master/config/readme.md" >&2
		exit 1
	fi
}




# Find home. Note that spaces currently aren't supported.
if [ "$BUHOME" == '' ]; then
	possibleHomes="/etc/bu" ~/.config/bu
	
	for possibleHome in $possibleHomes; do
		if [ -e "$possibleHome" ]; then	
			export BUHOME="$possibleHome"
		fi
	done
fi



# Load config
export buConfigFile="$BUHOME/config/general.sh"
if [ -e "$buConfigFile" ]; then
	. "$buConfigFile"
else
	echo "$0: Could not find \"$buConfigFile\". See https://github.com/ksandom/bu/blob/master/config/general.example.sh" >&2
	exit 1
fi



# Load common libraries
. $BUHOME/common/parameters.sh
