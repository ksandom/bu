# Display functionality

function debug
{
	level="$(1:-0)"
	message="$2"
	
	if [ "$debugLevel" -lt "$level" ]; then
		echo "$0 DEBUG$level: $message" >&2
	fi
}

function message
{
	messageName="$1"
	
	messageFile="$BUHOME/docs/messages/$messageName"
	if [ -e "$messageFile" ]; then
		cat "$messageFile"
	else
		echo "$0 message: Oh dear. I was trying to display the message \"$messageName\" but couldn't find it. I was looking for \"$messageFile\". The program can continue without this file." >&2
	fi
}