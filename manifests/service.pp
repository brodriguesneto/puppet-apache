class apache::service {
  service { $apache::params::service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['apache::config'],
  }
}
