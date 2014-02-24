#!/bin/bash
# Performs a linked install of bu (backup) to the current users' home directory.


# TODO make this more resilient/flexible.
if [ ! -e "common/bootstrap.sh" ]; then
	echo "$0: I can't find \"common/bootstrap.sh\". For now you need to be in the root of the repository. If in doubt, have a look at the [readme](https://github.com/ksandom/bu/blob/master/README.md)."
	exit 1
fi

# Get started
export BUHOME="`pwd`/common"
. common/bootstrap.sh


require "display.sh"
require "install.sh"

message "install/welcome.md"


