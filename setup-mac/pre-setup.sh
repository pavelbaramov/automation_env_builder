#!/bin/bash

echo "Enable developer mode"
sudo /usr/sbin/DevToolsSecurity --enable

echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"