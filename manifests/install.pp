class needrestart::install inherits needrestart {

  package { 'needrestart':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
