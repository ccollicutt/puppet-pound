class pound::params {

  $autoupdate           = false
  $config_template      = 'pound/pound.cfg.erb'
  $package_ensure       = 'present'
  $service_enable       = true
  $service_ensure       = 'running'
  $service_manage       = true
  $listen_http_address  = '127.0.0.1'
  $listen_http_port     = '8080'
  $backend_servers      = { '127.0.0.1' => '80' }
  $log_level            = '1'

  case $::osfamily {
    'Debian': {
      $config          = '/etc/pound/pound.cfg'
      $package_name    = [ 'pound' ]
      $service_name    = 'pound'
      $control_socket  = '/var/run/pound/poundctl.socket'
      $pound_user      = 'www-data'
      $pound_group     = 'www-data'
    }
    'RedHat': {
      $config          = '/etc/pound.cfg'
      $package_name    = [ 'Pound' ]
      $service_name    = 'pound'
      $control_socket  = '/var/lib/pound/pound.cfg'
      $pound_user      = 'pound'
      $pound_group     = 'pound'
    }
    default: {
      fail("The ${module_name} module is only supported on Debian and RedHat based systems.")
    }
  }
}
