#!/bin/bash  
. ~/.bash_profile > /dev/null

IP=$1
PORT=$2
PROJECTNAME=$3
NIP=`echo ${IP//./_}`
CLIENTLOG_PREFIX=$4
CLIENTPORT=$5
INSTALL=install.sql
INSTALL56=mysql56-install.sql
if [ $# -ne 5 ]; then
        echo "example:)   bash  new_database_for_server.sh    ip  port  projectname  clientlogfilepath clientport"
        exit 0
fi

if [ -z $IP ];then
  echo 'first arg is host ip'
  exit
fi
if [ -z $PORT ];then
  echo 'second arg is mysql server port'
  exit
fi
if [ -z $PROJECTNAME ];then
  echo 'third  arg is project name'
  exit
fi
if [ -z $CLIENTLOG_PREFIX ];then
  echo 'fourth arg is mysql client logfile path'
  exit
fi
if [ -z $CLIENTPORT ];then
  echo 'fifth  arg is mysql client  port'
  exit
fi

#分库使用，一个client使用一个库，在datastore里面配置（当有需要单独分开某个数据库的slow的时候使用）
#SLOWDATABASE=slow_query_log_${NIP}_${PORT}
#cp      $INSTALL     new_install.sql
#cp      $INSTALL56   new_mysql56-install.sql
#sed -i "s#SLOWDATABASE#$SLOWDATABASE#g"   new_install.sql
#sed -i "s#SLOWDATABASE#$SLOWDATABASE#g"   new_mysql56-install.sql
#mysql -uroot  -proot   < new_install.sql
#mysql -uroot  -proot   < new_mysql56-install.sql 

cp  anemometer-localhost.cnf   new_anemometer-localhost.cnf 
cp  anemometer-server.cnf   new_anemometer-server.cnf 
sed  -i "s#SOCKETFILE#$CLIENTLOG_PREFIX#g"  new_anemometer-localhost.cnf

cp anemometer_collect.sh  new_anemometer_collect.sh 
sed -i "s#LOG_PREFIXNAME#$CLIENTLOG_PREFIX#g" new_anemometer_collect.sh
sed -i "s#PORTNAME#$CLIENTPORT#g" new_anemometer_collect.sh

#sed -i "s#HISTDBNAME#$SLOWDATABASE#g"  new_anemometer_collect.sh 
