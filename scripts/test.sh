#!/bin/bash 
DATE=`date +"%Y%m%d-%H%M%S"`
LOG_HISTORY_FILE="/data/mysql/mysql3306/data/${DATE}-slow.log"
echo $DATE
echo $LOG_HISTORY_FILE
