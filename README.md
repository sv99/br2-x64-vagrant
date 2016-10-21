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
make BR2_EXTERNAL=/vagrant/buildroot-v2r-v1 menuconfig
```

## BR2 overlay dir

add_br2_package_overlay_dir.patch

Позволяет менять параметры в стандартных пакетах buildroot без изменения исходников.
В текущей конфигурации нужно менять параметры для nginx - поддержка rtsp.

```bash
cd fs/
git patch ../buildroot-v2r-v1/add_br2_package_overlay_dir.patch
...
git checkout .
git pull upstream master
git patch  ../buildroot-v2r-v1/add_br2_package_overlay_dir.patch
```

## send patch

Provision setup git-send-email.

Configure smtp server password:
```bash
git config --global sendemail.smtppass xxxx
```

```bash
# make fix
git checkout -b <fix_branch_name>
# commit changes
git commit -m "<package_name>: fix info"
# generate patches
git format-patch -M -n -s -o outgoing origin/master
# correct patches in the outgoing folder ...
# send patch
git send-email --to buildroot@buildroot.org --cc "Volkov Viacheslav <sv99@inbox.ru>" outgoing/0001-fix-zbar-build.patch
```

