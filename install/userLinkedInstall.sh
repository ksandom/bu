#!/bin/bash
# Performs a linked install of bu (backup) to the current users' home directory.

# Were bu will be installed.
export NEWBUHOME=~/.config/bu
export BINHOME=~/bin

# Check that we can find the libraries.
# TODO make this more resilient/flexible.
if [ ! -e "common/bootstrap.sh" ]; then
	echo "$0: I can't find \"common/bootstrap.sh\". For now you need to be in the root of the repository. If in doubt, have a look at the [readme](https://github.com/ksandom/bu/blob/master/README.md)."
	exit 1
fi

# Get started.
export BUHOME="`pwd`"
. common/bootstrap.sh


# Load libraries.
require "display.sh"
require "install.sh"
require "parameters.sh"


# Do the installation.
beginLog
logBasicInfo
message "install/welcome.md"
assertHome

findAllBin | pipedInstallLN
assertRemainingHomeLN
