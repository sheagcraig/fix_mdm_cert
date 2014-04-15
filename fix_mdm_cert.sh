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
# I have this cleaning up every time, because if it should fail, Jamf is
# going to reinstall the package anyway, so there's probably no sense in
# running this over and over again.
launchctl unload -w $LAUNCHD
rm $LAUNCHD
