# Class: apache
class apache ($ensure = 'present', $autoupgrade = false,) inherits apache::params {
  case $ensure {
    /(present)/ : {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/  : {
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }
  include apache::install, apache::config, apache::service
  Class['apache::install'] -> Class['apache::config'] ~> Class['apache::service']
}
