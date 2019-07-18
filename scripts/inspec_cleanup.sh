#!/bin/bash

echo "#"
echo "#"
echo "#"
echo "# Cleaning up inspec and extras from the template!"
echo "#"
echo "#"
echo "#"
sudo dpkg --remove inspec
sudo rm -rf ~/.chef
sudo rm -rf ~/.ansible
sudo rm -rf ~/.inspec
