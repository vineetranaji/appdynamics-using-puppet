class appdynamics {
  $installer_script = 'appdynamics_installer.sh'
  $config_template = 'appdynamics_config.erb'

  file { '/tmp/${installer_script}':
    source => "puppet:///modules/appdynamics-puppet/${installer_script}",
    mode   => '0755',
  }

  exec { 'install_appdynamics':
    command => "/tmp/${installer_script}",
    path    => ['/bin', '/usr/bin'],
    require => File["/tmp/${installer_script}"],
  }

  file { '/etc/appdynamics/config.conf':
    content => template('appdynamics-puppet/${config_template}'),
    mode    => '0644',
    require => Exec['install_appdynamics'],
  }
}