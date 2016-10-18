# TRACE [![Build Status](https://travis-ci.org/utkdigitalinitiatives/TRACE.svg?branch=Sprint-%234)](https://travis-ci.org/utkdigitalinitiatives/TRACE)
<description>Trace is a University of Tennessee digital archive that showcases and preserves published and unpublished works by faculty, departments, programs, research ...</description>

What is the Institutional Repository Project?

The Libraries is currently investigating open source IR systems with the intention to select and implement a new institutional repository platform to replace the hosted Bepress Digtial Commons instance of Trace.

The TRACE project in github is a virtual platform for the DI programmers to investigate the most effective solutions for the IR Project.  

This virtual platform should support
 * Creation of a migration plan
 * Determination of hardware requirements
 * An agile software development environment
 * A secure testing environment
 * The ability to demonstrate the look and behavior of the site to our peers outside of the DI programming group

## Introduction

The is a development environment virtual machine for Islandora 7.x-1.x. It should work on any operating system that supports VirtualBox and Vagrant.

N.B. This virtual machine **should not** be used in production.


## Requirements

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](http://www.vagrantup.com)
3. [git](https://git-scm.com/)

## Setup on OS X
Video on how to Open Terminal on a MAC
[![Open Terminal](http://img.youtube.com/vi/zw7Nd67_aFw/0.jpg)](https://youtu.be/zw7Nd67_aFw)

__Install brew, virtualbox, vagrant, and git__

### Copy and Paste this into terminal and hit enter
```
sh -c "`curl -fsSL https://gist.githubusercontent.com/DonRichards/d5674631e20c2e7c946712883e2caa81/raw/770436972b11a7a8a62698e5f8d5939c93511abb/remote-setup.sh`"
```

#### This is a breakdown on what this code does (Skip if you did previous step)

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install homebrew/completions/brew-cask-completion
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew install git
cd ~/desktop
git clone https://github.com/utkdigitalinitiatives/TRACE
cd islandora_vagrant
vagrant up
```

### Windows Setup
1. [Install VirtualBox](http://download.virtualbox.org/virtualbox/5.1.6/VirtualBox-5.1.6-110634-Win.exe)
2. [Install Vagrant](https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5.msi)
3. [32bit Install git](https://github.com/git-for-windows/git/releases/download/v2.10.0.windows.1/Git-2.10.0-32-bit.exe)<br/>
[64bit Install git <-- most likely this one](https://github.com/git-for-windows/git/releases/download/v2.10.0.windows.1/Git-2.10.0-64-bit.exe)

__Note: To open "terminal" in windows__<br/>
Hold Windows Key and type r<br/>
![alt text](http://support.kaspersky.com/images/11854_0713-263486.png)

This will open a run window. Type __cmd__ and click OK<br/>
![alt text](http://poweronapp.com/help/xp-run-cmd.png)

### Download it to the desktop
Windows
```bash
cd %UserProfile%\Desktop\
git clone https://github.com/utkdigitalinitiatives/TRACE/
vagrant up
```

## Daily Use
### To Start<br/>
Open Terminal<br/>
OSX
```bash
cd ~/desktop/TRACE
vagrant up
```

Windows
```bash
cd %UserProfile%\Desktop\TRACE
vagrant up
```

### To Stop when done using TRACE<br/>
Open Terminal<br/>
OSX
```bash
cd ~/desktop/islandora_vagrant
vagrant halt
```

Windows
```bash
cd %UserProfile%\Desktop\TRACE
vagrant halt
```


### Oops. Messed up?
Just reset/delete everything in TRACE<br/>
Open Terminal<br/>
OSX
```bash
cd ~/desktop/islandora_vagrant
vagrant halt
vagrant destroy
vagrant up
```

Windows
```bash
cd %UserProfile%\Desktop\TRACE
vagrant destroy
vagrant up
```


## Open browser: [http://localhost:8000](http://localhost:8000)

No login: simulates general anonymous user

Authenticated login - any netid login, can submit,
 but it is held in workflow. If it is a ETD, it follows ETD forms and workflows.

  - username: authUser
  - password: authUser

  - username: userA
  - password: userA

  - username: userB
  - password: userB

Priviledged User login - a netid login that can submit outside of
 the workflow, like faculty.

  - username: privUser
  - password: privUser

Manager login - can assign users to roles, can approve submissions.
  - username: manager
  - password: manager

root Admin login: - for maintaining system, has all permissions.
  - username: admin
  - password: islandora

---
# Developer Notes

PhpMyAdmin was added to allow database work during development

phpmyadmin login:
  - username: root
  - password: islandora

MySQL:
  - username: root
  - password: islandora

Tomcat Manager:
  - username: islandora
  - password: islandora

Fedora:
  - username: fedoraAdmin
  - password: fedoraAdmin

GSearch:
  - username: fgsAdmin
  - password: fgsAdmin

ssh, scp, rsync:
  - username: vagrant
  - password: vagrant
  - Examples
    - `ssh -p 2222 vagrant@localhost` or `vagrant ssh`
    - `scp -P 2222 somefile.txt vagrant@localhost:/destination/path`
    - `rsync --rsh='ssh -p2222' -av somedir vagrant@localhost:/tmp`


## Notes
[Check out the Wiki for instructions and troubleshooting](https://github.com/utkdigitalinitiatives/TRACE/wiki)

## Travis Lint Failure
Install: https://github.com/koalaman/shellcheck

`shellcheck yourscript`
