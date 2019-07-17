#!/bin/bash

echo "#"
echo "#"
echo "#"
echo "Now checking nginx settings!"
echo "#"
echo "#"
echo "#"
CHEF_LICENSE="accept-silent" inspec exec https://github.com/jjasghar/nginx_profile
