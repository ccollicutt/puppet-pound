#!/bin/bash

echo 'Acquire::http { Proxy "http://10.10.10.10:3142"; };' > /etc/apt/apt.conf.d/01proxy

sudo mkdir -p /etc/puppet/modules;
sudo puppet module install puppetlabs/stdlib