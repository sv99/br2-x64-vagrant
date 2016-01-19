#!/bin/bash
MY_ECHO='echo -e'

${MY_ECHO} "\033[1;34mInstall requiments 1\033[0m"
sudo apt-get -y install build-essential git subversion mercurial make flex bison gcc g++ gettext texinfo u-boot-tools
${MY_ECHO} "\033[1;34mInstall requiments 2\033[0m"
sudo apt-get -y install ncurses-dev unzip groff bc dosfstools
${MY_ECHO} "\033[1;34mInstall requiments 3\033[0m"
sudo apt-get -y install autoconf pkg-config libtool gettext gcc-multilib

${MY_ECHO} "\033[1;34mMake /opt directory\033[0m"
sudo mkdir /opt
sudo chown vagrant /opt

${MY_ECHO} "\033[1;34mCorrect /bin/sh -> /bin/bash\033[0m"
sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh

if [ -d /opt/buildroot ]
then
  ${MY_ECHO} "\033[32mbuildroot found, skipping\033[0m"
  ${MY_ECHO} ""
else
  ${MY_ECHO} ""
  ${MY_ECHO} "\033[1;34mDownload buildroot\033[0m"
  ${MY_ECHO} ""
  git clone git://git.buildroot.net/buildroot
fi

