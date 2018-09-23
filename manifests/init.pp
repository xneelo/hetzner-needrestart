#
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
#
class needrestart(
  $action                        = $needrestart::params::action,
  $preferred_ui                  = $needrestart::params::preferred_ui,
  $ignorelist                    = $needrestart::params::ignorelist,
  $disable_kernel_hints          = $needrestart::params::disable_kernel_hints,
  $notify_user_obsolete_binaries = $needrestart::params::notify_user_obsolete_binaries,
  $package_ensure                = $needrestart::params::package_ensure,
  $package_name                  = $needrestart::params::package_name,
  $configs                       = {},
  $has_pam_systemd               = $needrestart::params::has_pam_systemd,
) inherits needrestart::params {


  $install = false

  case $::operatingsystem {
    'Debian': {
      $_install = true
    }

    'Ubuntu': {
      if versioncmp($::lsbdistrelease, '16.04') >= 0 {
        $_install = true
      }
    }

    default: {
        $_install = $install
      notice ("Your operating system ${::operatingsystem} is not supported by this module")
    }
  }

  if $_install {
    include needrestart::install
    include needrestart::config
  }
}
