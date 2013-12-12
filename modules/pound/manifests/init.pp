class pound (
  $autoupdate          = $pound::params::autoupdate,
  $config              = $pound::params::config,
  $config_template     = $pound::params::config_template,
  $package_ensure      = $pound::params::package_ensure,
  $package_name        = $pound::params::package_name,
  $service_enable      = $pound::params::service_enable,
  $service_ensure      = $pound::params::service_ensure,
  $service_manage      = $pound::params::service_manage,
  $service_name        = $pound::params::service_name,
  $pound_group         = $pound::params::pound_group,
  $pound_user          = $pound::params::pound_user,
  $listen_http_address = $pound::params::listen_http_address,
  $listen_http_port    = $pound::params::listen_http_port,
  $backend_address     = $pound::params::backend_address,
  $backend_port        = $pound::params::backend_port,
  $log_level           = $pound::params::log_level,

) inherits pound::params {

  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)
  validate_string($pound_user)
  validate_string($pound_group)
  validate_string($listen_http_address)
  validate_string($listen_http_port)
  validate_string($backend_address)
  validate_string($backend_port)


  anchor { 'pound::begin': } ->
  class { '::pound::install': } ->
  class { '::pound::config': } ~>
  class { '::pound::service': } ->
  anchor { 'pound::end': }

}
