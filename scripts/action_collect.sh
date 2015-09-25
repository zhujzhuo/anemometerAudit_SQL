#!/bin/bash

. ~/.bash_profile > /dev/null

sh -x ./anemometer_collect.sh --interval 30 --history-db-host  192.168.214.131  --defaults-file ./anemometer-localhost.cnf  --history-defaults-file ./anemometer-server.cnf
