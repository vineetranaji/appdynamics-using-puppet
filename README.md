# AppDynamics Puppet Module

This Puppet module automates the installation and configuration of the AppDynamics agent.

## Project Structure

```
appdynamics-puppet
├── manifests
│   ├── init.pp                # Main manifest for the Puppet module
├── files
│   └── appdynamics_installer.sh # Shell script for downloading and installing AppDynamics
├── templates
│   └── appdynamics_config.erb  # ERB template for AppDynamics configuration
├── metadata.json               # Metadata about the Puppet module
└── README.md                   # Documentation for the project
```

## Installation Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd appdynamics-puppet
   ```

2. **Install the module:**
   Use the Puppet module tool to install the module:
   ```
   puppet module install <module-name>
   ```

3. **Configure the module:**
   Edit the `appdynamics_config.erb` template to customize your AppDynamics configuration.

4. **Apply the manifest:**
   Run the following command to apply the Puppet manifest:
   ```
   puppet apply manifests/init.pp
   ```

## Usage

To use this module, include the class in your Puppet manifest:
```puppet
include appdynamics
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Author

[Your Name] - [Your Email] - [Your GitHub Profile]