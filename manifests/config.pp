class apache::config {
  file { $apache::params::apached_config:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/apached_config.erb"),
    require => Package[$apache::params::package],
    notify  => Service[$apache::params::service],
  }

  file { $apache::params::apache_config:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/apache_config.erb"),
    require => Package[$apache::params::package],
  }
}
