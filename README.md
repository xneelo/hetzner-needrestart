# needrestart

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with needrestart](#setup)
    * [What needrestart affects](#what-needrestart-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with needrestart](#beginning-with-needrestart)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Restarts needed services automatically.

Installs package, configures mode (list, automatic, interactive). Adds groups of services to ignore list.
## Setup

### What needrestart affects

Once installed, needrestart hooks into package management and init systems. For example, upgrading openssl via apt will restart
exim and apache if they have proper init scripts.

## Usage
To automatically restart everything except bareos-fd, mysql, exim4, dovecot and apache2 if needed:

class {'needrestart':
  action      => 'automatic',
  ignorelist  => {'Backups'    => ['bareos-fd'],
                  'Databases'  => ['mysql'],
                  'Mail'       => ['exim4','dovecot'],
                  'Webservers' => ['apache2']},
  }
}


## Limitations

Only tested on Debian
