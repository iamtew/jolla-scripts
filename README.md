# Jolla scripts

A collecting of handy scripts for the my Jolla telephone, might be of use to others. If the scripts require super-user access they will execute themselves through sudo.

## Installing `sudo`

To install sudo on the Jolla you need to login as root and add the `mer-tools` repository to be able to install:

```
devel-su
ssu addrepo mer-tools
pkcon refresh
pkcon install sudo
```

## Configuring `sudo`

For ease of management create a separate configuration file: `/etc/sudoers.d/nemo`

```
## Allows people in group nemo to run all commands
%nemo   ALL=(ALL)   NOPASSWD: ALL
```
