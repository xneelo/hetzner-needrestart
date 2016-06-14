class needrestart::params(
  $action          = 'list',
  $ignorelist      = {'#Apache'  => ['#apache2'], '#Backups' => ['#bareos-fd', '#bareos-sd']},
  $package_ensure  = 'installed',
  $package_name    = 'needrestart',
){}
