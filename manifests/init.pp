# Define the appdynamics class
class appdynamics {
  # Define variables for the installer script and configuration template
  $installer_script = 'appdynamics_installer.sh'
  $config_template = 'appdynamics_config.erb'

  # Ensure the installer script is present on the target system
  file { '/tmp/${installer_script}':
    source => "puppet:///modules/appdynamics-puppet/${installer_script}", # Source path of the script
    mode   => '0755', # Set the file permissions to be executable
  }

  # Execute the installer script to install AppDynamics
  exec { 'install_appdynamics':
    command => "/tmp/${installer_script}", # Command to run the installer script
    path    => ['/bin', '/usr/bin'], # Paths to search for executables
    require => File["/tmp/${installer_script}"], # Ensure the file resource is applied before this exec
  }

  # Generate the AppDynamics configuration file from the template
  file { '/etc/appdynamics/config.conf':
    content => template('appdynamics-puppet/${config_template}'), # Use the template to generate the file content
    mode    => '0644', # Set the file permissions to be readable
    require => Exec['install_appdynamics'], # Ensure the exec resource is applied before this file
  }

  # Ensure the AppDynamics service is running
  service { 'appdynamics':
    ensure     => running, # Ensure the service is running
    enable     => true, # Enable the service to start on boot
    hasstatus  => true, # The service has a status command
    hasrestart => true, # The service has a restart command
    require    => File['/etc/appdynamics/config.conf'], # Ensure the config file is present before starting the service
  }
}