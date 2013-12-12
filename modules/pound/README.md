#pound

####Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with pound](#setup)
    * [What pound affects](#what-pound-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pound](#beginning-with-pound)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Module Description

Installs, configures and starts Pound.

##Setup

###What pound affects

* pound package
* pound configuration file
* pound service

###Beginning with pound

include '::pound' is enough to get you up and running.  If you wish to pass in
parameters like which servers to use then you can use:

```puppet
class { '::pound':
}
```

##Usage

All interaction with the pound module can do be done through the main pound class.
This means you can simply toggle the options in the pound class to get at the
full functionality.

###I just want Pound, what's the minimum I need?

```puppet
include '::pound'
```

###I'd like to opt out of having the service controlled, we use another tool for that.

```puppet
class { '::pound':
  manage_service => false,
}
```

###Looks great!  But I'd like a different template, we need to do something unique here.

```puppet
class { '::pound':
  manage_service  => false,
  config_template => 'different/module/custom.template.erb',
}
```

##Reference

###Classes

* pound: Main class, includes all the rest.
* pound::install: Handles the packages.
* pound::config: Handles the configuration file.
* pound::service: Handles the service.

###Parameters

The following parameters are available in the pound module

####`config`

This sets the file to write pound configuration into.

####`config_template`

This determines which template puppet should use for the pound configuration.

####`package_ensure`

This can be set to 'present' or 'latest' or a specific version to choose the
pound package to be installed.

####`package_name`

This determines the name of the package to install.

####`service_enable`

This determines if the service should be enabled at boot.

####`service_ensure`

This determines if the service should be running or not.

####`service_manage`

This selects if puppet should manage the service in the first place.

####`service_name`

This selects the name of the pound service for puppet to manage.

####`pound_user`

Set what user to run the pound service as.

####`pound_group`

Set what group to run the pound service as.

####`listen_http_address`

Set what address to listen for http on.

####`listen_http_port`

Set what port to listen for http on.

####`backend_address`

Set what address to send traffic to.

####`backend_port`

Set what port to send traffic to.

##Limitations

Currently there is no testing of the module.

The module has only been tested on:

* CentOS 6
* Ubuntu 12.04

##Development

Please lodge issues and send pull requests to the [github repository](https://github.com/curtisgithub/puppet-pound).

##Thanks

This module was based on the Puppetlabs NTP module.