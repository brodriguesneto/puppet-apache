class apache::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04)/ : {
          $package        = 'apache2'
          $packages_extra = ['apache2.2-common', 'apache2.2-bin', 'apche2-utils','libapr1', 'libaprutil1', 'libaprutil1-dbd-sqlite3', 'libaprutil1-ldap','ssl-cert']
          $package_mpm    = 'apache2-mpm-prefork'
          $service        = 'apache2'
        }
        default         : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
