# Get bu going

function require
{
	true
}


# Find home. Note that spaces currently aren't supported.
possibleHomes="/etc/bu" ~/.config/bu

for possibleHome in $possibleHomes; do
	if [ -e "$possibleHome" ]; then	
		export BUHOME="$possibleHome"
	fi
done

# Load config
if [ -e "$BUHOME/config/general" ]; then
	. "$BUHOME/config/general"
else
	echo "Could not find \"$BUHOME/config/general\"."
	exit 1
fi
