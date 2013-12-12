#puppet-pound

Deploy [Pound](http://www.apsis.ch/pound) with Puppet.

##tl;dr

Edit [apt-cacher-ng.sh](apt-cacher-ng.sh) to point to your local apt-cache if you are using Ubuntu. Otherwise comment it out of the Vagrantfile.

Then:

```
$ vagrant up
```

and a Ubuntu 12.04 Vagrant box will be booted and configured with pound.