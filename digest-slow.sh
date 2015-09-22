pt-query-digest --user=root --password=root  --review h=192.168.214.131,D=slow_query_log,t=global_query_review  --history h=192.168.214.131,D=slow_query_log,t=global_query_review_history  --no-report  --limit=0%  --filter="\$event->{Bytes} = length(\$event->{arg}) and \$event->{hostname}=\"$HOSTNAME\""   slow.log  
#--create-review-table  当使用--review参数把分析结果输出到表中时，如果没有表就自动创建。
#--create-history-table  当使用--history参数把分析结果输出到表中时，如果没有表就自动创建。
#--filter 对输入的慢查询按指定的字符串进行匹配过滤后再进行分析
#--limit限制输出结果百分比或数量，默认值是20,即将最慢的20条语句输出，如果是50%则按总响应时间占比从大到小排序，输出到总和达到50%位置截止。
#--host mysql服务器地址
#--user mysql用户名
#--password mysql用户密码
#--history 将分析结果保存到表中，分析结果比较详细，下次再使用--history时，如果存在相同的语句，且查询所在的时间区间和历史表中的不同则
#会记录到数据表中，可以通过查询同一CHECKSUM来比较某类型查询的历史变化。
#--review 将分析结果保存到表中，这个分析只是对查询条件进行参数化，一个类型的查询一条记录，比较简单。当下次使用--review时，如果存在相
#同的语句分析，就不会记录到数据表中。
#--output 分析结果输出类型，值可以是report(标准分析报告)、slowlog(Mysql slow log)、json、json-anon，一般使用report，以便于阅读。
#--since 从什么时间开始分析，值为字符串，可以是指定的某个”yyyy-mm-dd [hh:mm:ss]”格式的时间点，也可以是简单的一个时间值：s(秒)、h(小时)、m(分钟)、d(天)，如12h就表示从12小时前开始统计。
#--until 截止时间，配合—since可以分析一段时间内的慢查询。


