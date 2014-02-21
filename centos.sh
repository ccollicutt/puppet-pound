#!/bin/bash

pushd /tmp
	wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
	sudo rpm -Uvh epel-release-6*.rpm
popd

sudo mkdir -p /etc/puppet/modules;
sudo puppet module install puppetlabs/stdlib