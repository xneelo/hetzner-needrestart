class needrestart::params(
  $action               = 'list',
  $preferred_ui         = 'stdio',
  $disable_kernel_hints = true,
  $ignorelist           = {'#Apache'  => ['#apache2'], '#Backups' => ['#bareos-fd', '#bareos-sd']},
  $package_ensure       = 'installed',
  $package_name         = 'needrestart',
){}
