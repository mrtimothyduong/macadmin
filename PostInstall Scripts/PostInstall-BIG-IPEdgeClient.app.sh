#!/bin/sh

# A Postinstall Script that runs under the context of the user to add the Workspace ONE.app to the User's DOCK using DOCKUTIL.
# This script has been created for Workspace ONE UEM or AirWatch Console.
# echo statements will be logged to /Library/Application Support/AirWatch/Data/Munki/Managed Installs/Logs/ManagedSoftwareUpdate.log

LoggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
LoggedInUserHome="/Users/$LoggedInUser"

configureDefaultDock() {

echo "Logged in user is $LoggedInUser"
echo "Logged in user's home $LoggedInUserHome"

if [ -e /usr/local/bin/dockutil ]
then dockutilVersion=$(/usr/local/bin/dockutil --version)

echo "dockutil version: $dockutilVersion"

echo "Adding Downloads..."

/usr/local/bin/dockutil --add '/Applications/BIG-IP Edge Client.app' "$LoggedInUserHome"

touch "$LoggedInUserHome"/Library/Preferences/com.company.docksetup.plist

else echo "dockutil not installed, skipping initial dock setup..."

  fi

}

configureDefaultDock
killall -KILL Dock

exit 0
