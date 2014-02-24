# Install bu

installLog="$NEWBUHOME/installLog.md"
outputLog="$installLog"
debugLevel=1

function beginLog
{
	debug 5 "# Install log\n"
	debug 5 "Beginning log."
}

function logBasicInfo
{
	debug 2 "Install time:   `timestamp`"
	debug 2 "Installing to:  $NEWBUHOME"
	debug 2 "Installed from: `pwd`"
}

function assertConfig
{
	# Create the home/config directory. This function is the same regardless of whether the install is a linked or copied install.
	
	debug 2 "Creating home directory"
	mkdir -p "$NEWBUHOME" "$BINHOME"
	cp -nv "config/general.example.sh" "$NEWBUHOME/general.sh" | indentOutput 3
	cp "README.md" "$NEWBUHOME" | indentOutput 3
	
	installReadMe="$NEWBUHOME/README.md"
}


function findAllBin
{
	cd scripts
	find -type f | grep -v '\.md$'
	cd ..
}

function pipedInstallLN
{
	currentDirectory=`pwd`
	cd "$BINHOME"
	cut -b 3- | while read fileName; do
		fullFilePath="$currentDirectory/scripts/$fileName"
		debug 3 "Going to install \"$fullFilePath\" to \"$BINHOME\""
		ln -sf "$fullFilePath" .
	done
}