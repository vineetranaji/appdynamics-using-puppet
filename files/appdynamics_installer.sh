#!/bin/bash

# Define variables
APPDYNAMICS_VERSION="latest"
INSTALLER_URL="https://download.appdynamics.com/agent/appdynamics-agent-${APPDYNAMICS_VERSION}.sh"
INSTALLER_FILE="appdynamics-agent.sh"

# Download the AppDynamics installer
curl -o $INSTALLER_FILE $INSTALLER_URL

# Make the installer executable
chmod +x $INSTALLER_FILE

# Run the installer
./$INSTALLER_FILE

# Clean up
rm -f $INSTALLER_FILE