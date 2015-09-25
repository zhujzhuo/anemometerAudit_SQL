#!/bin/bash  
. ~/.bash_profile > /dev/null

IP=$1
PORT=$2
PROJECTNAME=$3
NIP=`echo ${IP//./_}`
INSTALL=install.sql
INSTALL56=mysql56-install.sql
if [ $# -ne 3 ]; then
        echo "example:)   bash  new_database_for_server.sh    ip  port  projectname"
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


SLOWDATABASE=slow_query_log_${NIP}_${PORT}
cp      $INSTALL     new_install.sql
cp      $INSTALL56   new_mysql56-install.sql
sed -i "s#SLOWDATABASE#$SLOWDATABASE#g"   new_install.sql
sed -i "s#SLOWDATABASE#$SLOWDATABASE#g"   new_mysql56-install.sql

mysql -uroot  -proot   < new_install.sql
mysql -uroot  -proot   < new_mysql56-install.sql 

