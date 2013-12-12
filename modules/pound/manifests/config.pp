#
class pound::config inherits pound {

  if $::osfamily == 'Debian' {
    file_line { '/etc/default/pound':
      path  => '/etc/default/pound',
      line  => 'startup=1',
      match => '^startup=',
    }
  }

  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($config_template),
  }

}