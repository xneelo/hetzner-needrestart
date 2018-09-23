#This class takes care of the package installation
class needrestart::install inherits needrestart {

  package { 'needrestart':
    ensure => $needrestart::params::package_ensure,
    name   => $needrestart::params::package_name,
  }
}
