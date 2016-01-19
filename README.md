# br2-vagrant
Development image based on ubuntu/trusty64

Need:
- [vagrant](https://www.vagrantup.com/downloads.html), provision - shell script, for windows compatibility.
- [virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [git](http://git-scm.com/downloads)
- [notepad++ - Windows only](https://notepad-plus-plus.org/) - for editing configuration files.

Recomeded vagrant plugins:
- [sahara](https://github.com/jedi4ever/sahara) - working with vm snapshot
- [vbguest](https://github.com/dotless-de/vagrant-vbguest) - for guest addons updating
```
# plugin installation
vagrant plugin install sahara
vagrant plugin install vagrant-vbguest
```

## Windows only
On windows need install git-scm.

Adjusting your PATH environment: default **Use Git from Git Bash only**

Configuring the line ending conversions: Need set to **Checkout as-is, commit as-is**

Before cloning check param core.autocrlf.

Run Git CMD:
```
git config --global core.autocrlf
>false
```
Must be False, if not then run:
```
git config --global core.autocrlf false
```

## Install buildroot
```
install_buildroot.sh
cd /opt/buildroot
```

