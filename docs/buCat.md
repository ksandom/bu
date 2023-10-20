# buCat

Catalogue a backup.

The intention of this is to run this command on every device in the backup. Then you have a searchable index of everything that is backed up, and know what device it is on. You also get various health information about the drive.

## How to use it

1. `cd` into the directory where you want to store the catalogue.
1. Run `buCat`.
1. It will ask for your sudo password by running `sudo true`. This is to make sure that it can operate quickly on the next steps to get concise logs from `dmesg`.
1. Insert the removable storage.
1. It will detect it, and perform all actions.
1. When the command exits, it is safe to remove the device.

## What the catalogue looks like

Here I have catalogued 2 drives:

```
ksandom@delli:~/cat$ ls -l
total 8
drwxr-xr-x 2 ksandom users 4096 Oct 20 12:42 b23-01
drwxr-xr-x 2 ksandom users 4096 Oct 20 15:56 B23-03
```

And here is the output of one of them:

```
ksandom@delli:~/cat/b23-01$ ls -lh
total 20M
-rw-r--r-- 1 ksandom users  20M Oct 20 12:52 contents.out
-rw-r--r-- 1 ksandom users  128 Oct 20 12:52 df.out
-rw-r--r-- 1 ksandom users  450 Oct 20 12:52 dmesg-mount.out
-rw-r--r-- 1 ksandom users 2.4K Oct 20 12:52 dmesg-plugIn.out
-rw-r--r-- 1 ksandom users  900 Oct 20 12:52 smartctl-all.out
-rw-r--r-- 1 ksandom users  685 Oct 20 12:52 smartctl-summary.out
```

I can search for the `P1390198-title.xcf` file:

```
ksandom@delli:~/cat$ grep P1390198-title.xcf */contents.out
b23-01/contents.out:mnt/unsorted/2021-03-21-rcCar/P1390198-title.xcf
```

This tells me that it's in the `b23-01` device, and that within that device, it's stored in `unsorted/2021-03-21-rcCar/`. The `mnt` is simply where the drive is mounted while it is being scanned.
