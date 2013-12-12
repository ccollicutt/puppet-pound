class pound::params {

  $autoupdate        = false
  $config_template   = 'pound/pound.conf.erb'
  $package_ensure    = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $udlc              = false

  case $::osfamily {
    'Debian': {
      $config          = '/etc/pound/pound.cfg'
      $package_name    = [ 'pound' ]
      $service_name    = 'pound'
    }
    'RedHat': {
      $config          = '/etc/pound/pound.cfg'
      $package_name    = [ 'pound' ]
      $service_name    = 'pound'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
