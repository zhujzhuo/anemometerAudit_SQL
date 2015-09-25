1、生成本地客户端收集日志的脚本和配置文件
bash   client_scripts_new.sh  /data1/mysql/bmnova/var    3306
2、可以部署到客户端，定时的收集slow log ，每天一次即可，slow log按时切换
action_collect.sh  

