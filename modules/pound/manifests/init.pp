class pound (
  $autoupdate        = $pound::params::autoupdate,
  $config            = $pound::params::config,
  $config_template   = $pound::params::config_template,
  $package_ensure    = $pound::params::package_ensure,
  $package_name      = $pound::params::package_name,
  $service_enable    = $pound::params::service_enable,
  $service_ensure    = $pound::params::service_ensure,
  $service_manage    = $pound::params::service_manage,
  $service_name      = $pound::params::service_name,
) inherits pound::params {

  /*
  validate_absolute_path($config)
  validate_string($config_template)
  validate_absolute_path($driftfile)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)
  */

  anchor { 'pound::begin': } ->
  class { '::pound::install': } ->
  class { '::pound::config': } ~>
  class { '::pound::service': } ->
  anchor { 'pound::end': }

}
