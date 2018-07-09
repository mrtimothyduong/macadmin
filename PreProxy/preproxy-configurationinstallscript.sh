#!/bin/sh

# A script to install PreProxy Configuration

LoggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
LoggedInUserHome="/Users/$LoggedInUser"

#createPreProxyFolder() {

echo "Logged in user is $LoggedInUser"
echo "Logged in user's home $LoggedInUserHome"

if [[ -e /Applications/Preproxy.app ]];
then
    echo "PreProxy Application is installed"

  else
    echo "PreProxy Application is not yet installed"
    mkdir "$LoggedInUserHome/Library/Group Containers/4EVWBBD4BP.io.github.hamstergene.preproxy"

fi

echo "Copying Preproxy Configuration File to Directory"
  curl -o ~/Library/Group\ Containers/4EVWBBD4BP.io.github.hamstergene.preproxy/preproxy-configuration.json "https://s3-ap-southeast-2.amazonaws.com/telstramacos/preproxy/preproxy-configuration.json"

  sleep 2

/usr/bin/open -gnW -a /Applications/Preproxy.app ~/Library/Group\ Containers/4EVWBBD4BP.io.github.hamstergene.preproxy/preproxy-configuration.json

#}

exit 0
