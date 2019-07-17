#!/bin/bash

echo "#"
echo "#"
echo "#"
echo "Some sanity checks because we have 'policies!'"
echo "#"
echo "#"
echo "#"
CHEF_LICENSE="accept-silent" inspec exec https://github.com/dev-sec/linux-baseline --controls os-02
