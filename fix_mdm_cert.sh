#!/bin/bash

# Remove the MDM profile, enforce the Jamf management framework, and then
# recon. Clean up afterwards.
LAUNCHD=/Library/LaunchDaemons/org.da.fix_mdm_cert.plist
# Make sure that we don't get the "Management Framework will be enforced as
# soon as all policies are done executing" message.
# Not sure that this is a problem though.
killall jamf
# Remove Jamf's profile, then reinstall it
if jamf removeMDMProfile && jamf manage; then
	jamf recon
fi
# Clean up
launchctl unload -w $LAUNCHD
rm $LAUNCHD
