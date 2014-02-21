#puppet-pound

Deploy [Pound](http://www.apsis.ch/pound) with Puppet.


```
root@ubuntu-pound-01:~# mkdir /etc/puppet
root@ubuntu-pound-01:~# puppet module install puppetlabs/stdlib
root@ubuntu-pound-01:~# puppet apply --modulepath=/vagrant/modules:/etc/puppet/modules --manifestdir=/vagrant/manifests /vagrant/manifests/site.pp
```