#!/bin/bash

# This script detects the changes between CityGML files representing the
# buildings of the city of Lyon at two different vintages and outputs the
# changes as graphML-JSON files.

# Awaited parameters:
# * output folder for the intermdiate data and for the final result.

# This script only works when invocated where it stands...
cd "$(dirname "$0")" || exit

# Check that parameters are correctly provided
if [ $# != 1 ]
  then
	  echo "Awaited parameters: output folder."
    exit 1
fi

######## Configure what needs to be (with j2cli)
echo "--- Configuring data base servers (and clients)"
#j2 3dCityDBImpExpConfig.j2 DBConfig2009.yml -o 3dCityDBImpExpConfig-2009.xml
#j2 3dCityDBImpExpConfig.j2 DBConfig2012.yml -o 3dCityDBImpExpConfig-2012.xml
j2 3dCityDBImpExpConfig.j2 DBConfig2015.yml -o 3dCityDBImpExpConfig-2015.xml

#j2   LaunchDataBaseSingleServer.sh.j2 DBConfig2009.yml \
#  -o LaunchDataBaseServerFirst.sh
####j2   LaunchDataBaseSingleServer.sh.j2 DBConfig2012.yml \
###  -o LaunchDataBaseServerSecond.sh
j2   LaunchDataBaseSingleServer.sh.j2 DBConfig2015.yml \
  -o LaunchDataBaseServerThird.sh
chmod a+x LaunchDataBaseServerThird.sh
          #LaunchDataBaseServerFirst.sh \
          #LaunchDataBaseServerSecond.sh \


#
