#
# class to configure needrestart
#
# Parameters:
#
# [*overwrite_default_conf*]
#  set this to false if you do not want to overwrite
#  needrestart.conf installed from the package maintainer.
#  defaults to true.
#
class needrestart::config (
  $overwrite_default_conf = true,
) inherits needrestart {

  if $overwrite_default_conf {
    file {'/etc/needrestart/needrestart.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('needrestart/needrestart.conf.erb'),
      require => Class['needrestart::install'],
    }
  }

  file {'/etc/needrestart/conf.d/':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Class['needrestart::install'],
    purge   => true,
    recurse => true,
  } ->

  file {'/etc/needrestart/conf.d/README.needrestart':
    require => Class['needrestart::install'],
  } ->

  file {'/etc/needrestart/conf.d/overwrite.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('needrestart/overwrite.conf', { 'configs' => $needrestart::configs }),
    require => Class['needrestart::install'],
  }
}
