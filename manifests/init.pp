# main class for needrestart
#
# Parameters:
# [*configs*]
#   hash of configuration parameters to overwrite from default.
#   Example (hiera):
#   needrestart::configs:
#     ui_mode: 'a'
#     restart: 'l'
#     defno: 0
#     blacklist:
#       - 'qr(^/usr/bin/sudo(\.dpkg-new)?$)'
#       - 'qr(^/sbin/(dhclient|dhcpcd5|pump|udhcpc)(\.dpkg-new)?$)'
#     override_rc:
#       'qr(^dbus)': 0
#       'qr(^gdm)': 0
# @param package_ensure - Package ensure value
# @param package_name - Package name
class needrestart (
  Hash $configs                  = {},
  String $package_ensure                = $needrestart::params::package_ensure,
  String $package_name                  = $needrestart::params::package_name,
) inherits needrestart::params {
  $install = false

  case $facts['os']['name'] {
    'Debian': {
      $_install = true
    }

    'Ubuntu': {
      if versioncmp($facts['os']['distro']['release']['full'], '16.04') >= 0 {
        $_install = true
      }
    }

    default: {
      $_install = $install
      notice ("Your operating system ${facts['os']['name']} is not supported by this module")
    }
  }

  if $_install {
    include needrestart::install

    file { '/etc/needrestart/conf.d/':
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      require => Class['needrestart::install'],
      purge   => true,
      recurse => true,
    }
    file { '/etc/needrestart/conf.d/README.needrestart':
      ensure => 'file',
    }

    unless $configs == {} {
      class { 'needrestart::config':
        config_overrides => $configs,
      }
    }
  }
}
