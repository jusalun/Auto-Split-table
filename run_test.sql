truncate table drilling_history;
call test_pro_prefetch(1000000,'2019-03-01');
call test_pro_prefetch(2000000,'2019-03-02');
call test_pro_prefetch(3000000,'2019-03-03');
call test_pro_prefetch(4000000,'2019-03-05');
call test_pro_prefetch(5000000,'2019-03-06');
call test_pro_prefetch(6000000,'2019-03-07');
call test_pro_prefetch(7000000,'2019-03-09');
call test_pro_prefetch(8000000,'2019-03-08');
call test_pro_prefetch(9000000,'2019-03-09');
call test_pro_prefetch(10000000,'2019-03-10');
call test_pro_prefetch(11000000,'2019-03-11');
call test_pro_prefetch(12000000,'2019-03-12');
call test_pro_prefetch(13000000,'2019-03-13');
call test_pro_prefetch(14000000,'2019-03-14');
drop table drilling_history_20190320;
delete from table_backlog
where tablename='drilling_history_20190320';
truncate table error_log;
call test_frist_pro_prefetch('drilling_history',@a,@b);

select count(1) from drilling_history_20190320;
select count(1) from drilling_history;