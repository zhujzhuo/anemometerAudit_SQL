#!/bin/bash  
. ~/.bash_profile > /dev/null

CLIENTLOG_PREFIX=$1
CLIENTPORT=$2
if [ $# -ne 2 ]; then
        echo "example:)   bash  client_scripts_new.sh    clientlogfilepath clientport"
        exit 0
fi

if [ -z $CLIENTLOG_PREFIX ];then
  echo 'first arg is mysql client logfile path'
  exit
fi
if [ -z $CLIENTPORT ];then
  echo 'second  arg is mysql client  port'
  exit
fi

cp  anemometer-localhost.cnf   new_anemometer-localhost.cnf 
cp  anemometer-server.cnf   new_anemometer-server.cnf 
sed  -i "s#SOCKETFILE#$CLIENTLOG_PREFIX#g"  new_anemometer-localhost.cnf

cp anemometer_collect.sh  new_anemometer_collect.sh 
sed -i "s#LOG_PREFIXNAME#$CLIENTLOG_PREFIX#g" new_anemometer_collect.sh
sed -i "s#PORTNAME#$CLIENTPORT#g" new_anemometer_collect.sh
