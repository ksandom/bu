# newDevice

Run before inserting a removable medium. When the new medium is detected, it will return the filename in /dev. Eg

```bash

# Get the device into a variable.
device="$(newDevice)"

# Get the full path so that we can work with it.
fullPath="/dev/$device"

# Would return something like: sdh1 -> /dev/sdh1
echo "$device -> $fullPath"
```
