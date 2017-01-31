class needrestart::params(
  $action                        = 'list',
  $preferred_ui                  = 'stdio',
  $disable_kernel_hints          = true,
  $notify_user_obsolete_binaries = true,
  $ignorelist                    = {},
  $package_ensure                = 'installed',
  $package_name                  = 'needrestart',
){}
