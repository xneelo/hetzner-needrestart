class needrestart(
  $action                        = $needrestart::params::action,
  $preferred_ui                  = $needrestart::params::preferred_ui,
  $ignorelist                    = $needrestart::params::ignorelist,
  $disable_kernel_hints          = $needrestart::params::disable_kernel_hints,
  $notify_user_obsolete_binaries = $needrestart::params::notify_user_obsolete_binaries,
  $package_ensure                = $needrestart::params::package_ensure,
  $package_name                  = $needrestart::params::package_name,
) inherits needrestart::params {

  $install = false

  case $::operatingsystem {
    'Debian': {
      $_install = true
    }

    'Ubuntu': {
      if versioncmp($::lsbdistrelease, '14.04') >= 0 {
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
