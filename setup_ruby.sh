#! /bin/sh

# This script write for Ubuntu 12.0.4 LTS 64bit.
# Discribe: Install ruby 1.9 and 2.0 by rbenv.

echo 'refresh packages'
dpkg -l > default_packages
sudo apt-get update
sudo apt-get upgrade

echo 'Install tools'
sudo apt-get install git-core curl vim-gnome
#sudo apt-get install zlib1g-dev

echo 'Run rbenv-installer'
curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

echo 'set \$RBENV_ROOT and Path in ~\/\.bashrc'
if [ -z "{RBENV_ROOT}" ]; then
    echo RBENV_ROOT="$HOME/.rbenv" >> ~/.bashrc
fi

if [ -d \"\${RBENV_ROOT}\" ]; then
    echo 'export PATH="${RBENV_ROOT}/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
fi

echo 'Install ruby 1.9'
rbenv install 1.9.3-p392
rbenv rehash
rbenv global 1.9.3-p392
ruby -v

echo 'Install ruby 2.0'
sudo apt-get install libssl-dev
rbenv install 2.0.0-p0
rbenv rehash
rbenv global 2.0.0-p0
ruby -v

echo 'Finish Ruby install'



