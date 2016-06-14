class needrestart::config inherits needrestart {

  file {'/etc/needrestart/needrestart.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('needrestart/needrestart.conf.erb'),
    require => Class['needrestart::install'],
  }

  file {'/etc/needrestart/conf.d/customisations.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('needrestart/needrestart_customisations.conf.erb'),
    require => Class['needrestart::install'],
  }
}
