-- 清除测试数据
truncate table drilling_history;

-- 删除备份日志表记录
truncate table table_backlog;
truncate table error_log;
-- 删除测试备份表
drop table drilling_history_20190417;

-- 准备测试数据
call test_pro_prefetch(1000,'2019-04-15');
call test_pro_prefetch(2000,'2019-04-16');
call test_pro_prefetch(3000,'2019-04-17');
call test_pro_prefetch(4000,'2019-04-18');

-- 分表测试:将drilling_history表'2019-04-17'之前的数据迁移，默认保留此日期前的数据，可调整p_prefetch参数将保留此日期前几日的数据，或者直接按p_data_checktime切分数据不必调整p_prefetch，@a返回执行状态，@b返回信息
call test_frist_pro_prefetch('drilling_history','2019-04-17',0,@a,@b);

-- 检查分表结果，drilling_history_20190417表为备份表，后缀是取执行job日日期添加的
select report_date,count(1) from drilling_history_20190417
group by report_date;

select report_date,count(1) from drilling_history
group by report_date;

-- 检查断点日志
select * from error_log

