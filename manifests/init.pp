class needrestart(
  $action               = $needrestart::params::action,
  $preferred_ui         = $needrestart::params::preferred_ui,
  $ignorelist           = $needrestart::params::ignorelist,
  $disable_kernel_hints = $needrestart::params::disable_kernel_hints,
  $package_ensure       = $needrestart::params::package_ensure,
  $package_name         = $needrestart::params::package_name,
) inherits needrestart::params {

  include install
  include config
}
