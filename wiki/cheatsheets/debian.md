# Awesome Debian Cheatsheet

Debian has three different releases:

- stable (codename: `buster`)
- testing (codename: `bullseye`)
- unstable (codename: `sid`)

The default Debian installation is of course based on the stable release.
The codenames changes accordingly with each new release.


**Upgrading to Testing**

To upgrade Debian to the testing release, do:
```
cd /etc/apt/

# create backup
sudo cp sources.list sources.list.backup
```

In `sources.list` the release name (`buster`, `bullseye`, etc.) or the release class (`stable`, `testing`, etc.) needs to be set.
Furthermore, the server needs to be chosen. 
A list of all avaible Debian servers can be found (here)[https://www.debian.org/mirror/list].


So, for example, this can be set:
```
deb http://ftp.de.debian.org/debian/ testing main
```

Now update the system:
```
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
```
