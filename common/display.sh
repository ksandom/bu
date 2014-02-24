# Display functionality

function debug
{
	# Send out debugging information. The debug level defines whether the output will be showen in the terminal. If "$outputLog" is set, all output will go there.
	
	level="${1:-0}"
	message="$2"
	
	if [ "$debugLevel" -ge "$level" ]; then
		echo "DEBUG$level $0: $message" >&2
	fi
	
	if [ "$outputLog" != '' ]; then
		echo "DEBUG$level $0: $message" >> "$outputLog"
	fi
}

function message
{
	messageName="$1"
	
	messageFile="$BUHOME/docs/messages/$messageName"
	if [ -e "$messageFile" ]; then
		cat "$messageFile"
		
		if [ "$outputLog" != '' ]; then
			debug 5 "message block ($messageName):"
			cat "$messageFile" >> "$outputLog"
		fi
	else
		debug 0 "$0 message: Oh dear. I was trying to display the message \"$messageName\" but couldn't find it. I was looking for \"$messageFile\". The program can continue without this file."
	fi
}

function timestamp
{
	date +"%Y-%m-%d--%H-%M-%S"
}

function indentOutput
{
	# This is so that the whole load can be read as mark down. The debug level defines whether the output will be showen in the terminal. If "$outputLog" is set, all output will go there.
	level="${1:-0}"
	
	
	# TODO This function needs to be taken out and shot..... And then refactored.
	
	
	# Add a blank line so that the output gets indented properly by the markdown interpreter
	if [ "$debugLevel" -ge "$level" ]; then
		echo
	fi
	if [ "$outputLog" != '' ]; then
		echo >> "$outputLog"
	fi
	
	# Indent the output
	while read line; do
		if [ "$debugLevel" -ge "$level" ]; then
			echo "    $line"
		fi
		if [ "$outputLog" != '' ]; then
			echo "    $line" >> "$outputLog"
		fi
	done
	
	# Add a blank line so that the output gets indented properly by the markdown interpreter
	if [ "$debugLevel" -ge "$level" ]; then
		echo
	fi
	if [ "$outputLog" != '' ]; then
		echo >> "$outputLog"
	fi
}