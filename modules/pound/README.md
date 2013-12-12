#pound

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pound](#setup)
    * [What pound affects](#what-pound-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pound](#beginning-with-pound)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The Pound module installs, configures, and manages the pound service.

##Module Description

The Pound module handles running Pound across a range of operating systems and
distributions.  Where possible we use the upstream pound templates so that the
results closely match what you'd get if you modified the package default conf
files.

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

##Limitations

Currently there is no testing.

The module has only been tested on:

* CentOS 6
* Ubuntu 12.04

##Development

Send pull requests to [github](https://github.com/curtisgithub/puppet-pound)

##Thanks

This module was based on the Puppetlabs NTP module.