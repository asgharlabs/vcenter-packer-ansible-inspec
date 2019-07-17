#!/bin/bash

VERSION=4.7.3

wget https://packages.chef.io/files/stable/inspec/${VERSION}/ubuntu/18.04/inspec_${VERSION}-1_amd64.deb -O /tmp/inspec.deb
sudo dpkg -i /tmp/inspec.deb
