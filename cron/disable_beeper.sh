#!/bin/bash

UPS_NAME=ups
USERNAME=admin
PASSWORD=admin

# Get the current status
STATUS=$(upsc ${UPS_NAME} ups.beeper.status 2>/dev/null)

# If current status is not disabled, then disable it
if [[ "${STATUS}" != "disabled" ]]; then
  upscmd -u ${USERNAME} -p ${PASSWORD} ${UPS_NAME} beeper.toggle
fi

