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

function assertHome
{
	# Create the home/config directory. This function is the same regardless of whether the install is a linked or copied install.
	
	debug 2 "Creating home directory"
	mkdir -p "$NEWBUHOME/config" "$BINHOME"
	cp -nv "config/general.example.sh" "$NEWBUHOME/config/general.sh" | indentOutput 3
	cp "README.md" "$NEWBUHOME" | indentOutput 3
	
	installReadMe="$NEWBUHOME/README.md"
}

function assertRemainingHomeLN
{
	debug 2 "Installing remaining home directory components."
	cd "$NEWBUHOME"
	ln -sfv "$BUHOME/common" "$BUHOME/docs" . | indentOutput 3
	cd ~-
}

function findAllBin
{
	cd scripts
	find -type f | grep -v '\.md$'
	cd ..
}

function pipedInstallLN
{
	debug 2 "Installing scripts."
	currentDirectory=`pwd`
	cd "$BINHOME"
	cut -b 3- | while read fileName; do
		fullFilePath="$currentDirectory/scripts/$fileName"
		ln -sfv "$fullFilePath" . | indentOutput 3
	done
	cd ~-
}
