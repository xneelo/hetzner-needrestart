#
# class to configure needrestart
#
class needrestart::config (
  Array $config_overrides
  )

  inherits needrestart {

  file {'/etc/needrestart/conf.d/':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Class['needrestart::install'],
    purge   => true,
    recurse => true,
  }

  file {'/etc/needrestart/conf.d/README.needrestart':
    require => [File['/etc/needrestart/conf.d/'],Class['needrestart::install']],
  }

  file {'/etc/needrestart/conf.d/overrides.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('needrestart/overrides.conf', { 'configs' => $config_overrides }),
    require => [File['/etc/needrestart/conf.d/'],Class['needrestart::install']],
  }
}
