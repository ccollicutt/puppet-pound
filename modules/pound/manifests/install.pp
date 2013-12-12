#
class pound::install inherits pound {

  package { 'pound':
    ensure => $package_ensure,
    name   => $package_name,
  }

}