#Default parameter values for needrestart
# @param package_ensure - Package ensure value
# @param package_name - Package name
class needrestart::params (
  String $package_ensure                = 'installed',
  String $package_name                  = 'needrestart',
) {}
