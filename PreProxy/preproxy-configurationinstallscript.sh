#!/bin/sh

## A script to install a Preproxy Configuration into a location that the Preproxy.app is able to view/read. This is recommended to be installed either during Bootstrap or via a PostInstall Script / Profile. This script waits until Preproxy.app is installed.

## Created by Timothy Duong
## Version 1.0 July 2018
## TBA: Timeout on Infinite Loop

## While statement to loop until Preproxy.app exists in /Applications/Preproxy.app
  while [[ ! -e /Applications/Preproxy.app ]];
      do
        sleep 2
        echo "Waiting for Preproxy.app to be installed";
    done

## Command to download Preproxy Config to preproxy folder and wait 2 seconds
  echo "Copying Preproxy Configuration File to Directory"

      curl -o ~/Library/Group\ Containers/4EVWBBD4BP.io.github.hamstergene.preproxy/preproxy-configuration.json "https://hostserver.com/preproxy-configuration.json"

    sleep 3

## Open the Preproxy.config into Preproxy.app
  echo "Opening Preproxy Configuration File in Preproxy.app"

      /usr/bin/open -gnW -a /Applications/Preproxy.app ~/Library/Group\ Containers/4EVWBBD4BP.io.github.hamstergene.preproxy/preproxy-configuration.json

exit 0
