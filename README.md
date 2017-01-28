# needrestart puppet module

### Table of Contents

1. [Description](#description)
1. [Setup](#setup)
   * [What needrestart affects](#what-needrestart-affects)
1. [Usage](#usage)
1. [Parameters](#parameters)
1. [Limitations](#limitations)


## Description
Restarts needed services automatically.
Installs package, configures mode (list, automatic, interactive). Adds groups of services to ignore list.


## Setup

### What needrestart affects
Once installed, needrestart hooks into package management and init systems. For example, upgrading openssl via apt will restart exim and apache if they have proper init scripts.


## Usage
To automatically restart everything except bareos-fd, mysql, exim4, dovecot and apache2 if needed:
```
class { 'needrestart':
  action      => 'automatic',
  ignorelist  => {'Backups'    => ['bareos-fd'],
                  'Databases'  => ['mysql'],
                  'Mail'       => ['exim4','dovecot'],
                  'Webservers' => ['apache2']},
  }
}
```


## Parameters
### action
String to specify default action. Possible values are:
* __list__ (default)
* interactive
* automatic

### preferred_ui
String to set preferred ui. Possible values are:
* __stdio__ (default)
* debconf.

### ignorelist
See example in usage above.

### disable_kernel_hints
Boolean to specify if hints on pending kernel upgrades are hidden or not. Possible values are:
* __true__ (default)
* false

### notify_user_obsolete_binaries
Boolean to specify if a user is notified about obsolete binaries in his session or not. Possible values are:
* __true__ (default)
* false

### package_ensure
String for ensure parameter to the needrestart package. Default value is "__installed__".

### package_name
String to specify the package name. Default value is "__needrestart__".


## Limitations
Only tested on Debian 7.0 and Ubuntu >= 14.04

