class apache::install {
  package { [$apache::params::package, $apache::params::packages_extra, $apache::params::package_mpm]:
    ensure => $apache::package_ensure,
  }
}
