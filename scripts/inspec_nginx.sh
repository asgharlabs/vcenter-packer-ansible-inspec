#!/bin/bash

echo "#"
echo "#"
echo "#"
echo "#"
echo "Now using InSpec to check our nginx settings!"
echo "#"
echo "#"
echo "#"
echo "#"
CHEF_LICENSE="accept-silent" inspec exec https://github.com/jjasghar/nginx_profile
