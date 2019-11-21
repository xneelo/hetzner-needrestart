#
# class to configure needrestart
#
class needrestart::config ( Hash $config_overrides
  ){

  file {'/etc/needrestart/conf.d/overrides.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('needrestart/overrides.conf', { 'configs' => $config_overrides }),
    require => [File['/etc/needrestart/conf.d/'],Class['needrestart::install']],
  }
}
