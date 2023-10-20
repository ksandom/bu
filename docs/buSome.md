# buSome

A way of backing up a huge number of similarly-sized things across multiple devices.

Example: Each episode of the [RandomKSandom series](https://www.randomksandom.com/rksSeries/) is typically made up of many shoots. These could be anywhere from a few photos taking up a few MB, to videos taking up 60GB. While those beside each other seem pretty different in size, they are similar enough for the purposes of backing up to several old 1TB HDDs.

## How it works

1. Start backing up one directory at a time until it errors.
1. When it errors, it displays what number in the sequence it was up to.
    * It provides a command that you can copy and paste to remove the failed directory. This is worth doing so that it doesn't get mistaken for a complete backup of that directory. This is manual in case there is something for you to debug.
1. You can then specify that sequence number what starting the process on the next drive, and it will continue where it left off.

If the backup gets interrupted, you can resume it with the same command, and it will figure out where to continue.

## How to use it

1. Mount the destination drive.
1. `cd` into the destination directory.
1. Run the command: `buSome /path/to/source 1`
    * `/path/to/source` is the directory containing all of the directories that you want to back up.
    * `1` is the position of the list of directories to start at. Eg if you specified 3, then it would start backing up the 3rd directory first, then the 4th. This is useful to continuing the same backup on the next storage medium.
    * You can also specify a limit of how many directories to back up. Eg `buSome /path/to/source 1 4` would back up the first 4 directories.
