class needrestart::config inherits needrestart {

  file {'/etc/needrestart/needrestart.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('needrestart/needrestart.conf.erb'),
    require => Class['needrestart::install'],
  }
}
