class needrestart::install inherits needrestart {

  package { 'needrestart':
    ensure => $needrestart::params::package_ensure,
    name   => $needrestart::params::package_name,
  }
}
