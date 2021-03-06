chromebrew2
==========

Package manager for Chrome OS

Supported Systems
-----------------

| Architecture | Supported? | Compiler tool |
|:---:|:---:|:---:|
| x86_64 | Yes | gcc 7.3.0 |
| i686 | Yes | gcc 7.3.0 |
| armv7l | Yes | gcc 7.3.0 |
| aarch64 | Yes | gcc 7.3.0 |

Overview
--------

Chromebooks with Chrome OS run a Linux kernel. The only missing pieces to use them as full-featured Linux distro were gcc and make with their dependencies. Well, these pieces aren't missing anymore. Say hello to chromebrew!

Prerequisites
-------------

You will need a Chromebook with developer mode enabled.  To do so, select your device on
[the ChromiumOS Wiki](https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices) and follow the instructions listed there.

Please be aware of the fact that developer mode is insecure if not properly configured. Setting a password as instructed in the VT-2 login screen is essential.

Installation
------------
Open the terminal with Ctrl+Alt+T and type `shell`.

If this command returns `ERROR: unknown command: shell` please have a second look at the prerequisites and make sure your Chromebook is in developer mode.

Then download and run the installation script below:

    curl -Ls https://raw.github.com/lovedheart/chromebrew2/master/install.sh | bash

Usage
-----

    crew <command> [-k|--keep] <package1> [<package2> ...]

Where available commands are:

  * build [build package(s) from source and store the archive and checksum in the current working directory]
  * download [download package(s) to `CREW_BREW_DIR` (`/usr/local/tmp/crew` by default), but don't install]
  * files [display installed files of package(s).]
  * help [get information about command usage]
  * install [install package(s) along with dependencies after prompting for confirmation]
  * list [available or installed packages]
  * remove [remove package(s)]
  * search [look for a package]
  * update [update crew itself]
  * upgrade [update all or specific package(s)]
  * whatprovides [regex search for package(s) that contains file(s)]

Available packages are listed in the [packages directory](https://github.com/skycocker/chromebrew/tree/master/packages).

Chromebrew will wipe its `BREW_DIR` (`/usr/local/tmp/crew` by default) after installation unless you pass `-k` or `--keep` when running `crew install`.

    crew install --keep <package1> [<package2> ...]

License
-------

Copyright 2013-2018 Michal Siwek and [all the awesome contributors](https://github.com/skycocker/chromebrew/graphs/contributors).

This project including all of its source files is released under the terms of [GNU General Public License (version 3 or later)](http://www.gnu.org/licenses/gpl.txt).

Our binary packages are hosted on [bintray](https://bintray.com/chromebrew2/chromebrew2).

<a href="https://bintray.com/chromebrew2/chromebrew2" target="_blank"><img src="https://github.com/skycocker/chromebrew/blob/master/images/Powered-by-Bintray_Banner_16-6-16-green.png" alt="Powered by Bintray" /></a>
