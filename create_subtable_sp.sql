CREATE  PROCEDURE `test_frist_pro`(in p_tablename varchar(50),out p_status int,out p_text varchar(200))
BEGIN
DECLARE v_count int DEFAULT 0;
DECLARE v_count1 int DEFAULT 0;
DECLARE v_count2 int DEFAULT 0;
DECLARE v_starttime datetime DEFAULT '1900-01-01';
DECLARE v_tablename varchar(50) DEFAULT 'fuckyou';
DECLARE v_tablename_new varchar(50) DEFAULT 'fuckyou';
DECLARE v_sql varchar(2000) DEFAULT 'fuckyou';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
show ERRORS;
ROLLBACK;
SET p_status=0,p_text='服务器忙，请稍后！';
SET autocommit=1;
END;
SET autocommit=0;
label_a:BEGIN
SET    v_tablename=p_tablename;
SET v_starttime=NOW();

select count(1),create_sql from list_table
where tablename =v_tablename into v_count,v_sql;

IF v_count!=1 THEN
SET p_status=2,p_text='未纳入自动切分计划，请先录入！';
LEAVE label_a;
END    IF;

select count(1) from information_schema.tables
where table_name =v_tablename into v_count1;

IF v_count1!=1 THEN
SET p_status=3,p_text=CONCAT(v_tablename,'数据库中不存在，无法备份！');
LEAVE label_a;
END    IF;

set v_tablename_new= CONCAT(v_tablename,'_',date(NOW())+0);

select count(1) from information_schema.tables
where table_name =v_tablename_new into v_count2;

IF v_count2!=0 THEN
SET p_status=4,p_text=CONCAT(v_tablename,'已备份过！');
LEAVE label_a;
END    IF;

SET @sqlstr2=CONCAT('RENAME TABLE ',v_tablename,' TO ',v_tablename_new);

PREPARE stmt2 FROM @sqlstr2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;

SET @sqlstr1=v_sql;

PREPARE stmt1 FROM @sqlstr1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

insert into table_backlog(tablename,source_tablename,amount_of_data,starttime,endtime)
values(v_tablename_new,v_tablename,0,v_starttime,NOW());


END;
COMMIT;
SET autocommit=1;
END

切分+数据回迁sp
CREATE  PROCEDURE `test_frist_pro_prefetch`(in p_tablename varchar(50),out p_status int,out p_text varchar(200))
BEGIN
DECLARE v_count int DEFAULT 0;
DECLARE v_count1 int DEFAULT 0;
DECLARE v_count2 int DEFAULT 0;
DECLARE v_day varchar(50) DEFAULT '1900-01-01';
DECLARE v_starttime datetime DEFAULT '1900-01-01';
DECLARE v_tablename varchar(50) DEFAULT 'fuckyou';
DECLARE v_tablename_new varchar(50) DEFAULT 'fuckyou';
DECLARE v_create_sql varchar(2000) DEFAULT 'fuckyou';
DECLARE v_insert_sql varchar(2000) DEFAULT 'fuckyou';
DECLARE v_delete_sql varchar(2000) DEFAULT 'fuckyou';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
show ERRORS;
ROLLBACK;
SET p_status=0,p_text='服务器忙，请稍后！';
SET autocommit=1;
END;
SET autocommit=0;
label_a:BEGIN
SET    v_tablename=p_tablename;
SET v_starttime=NOW();

select count(1),create_sql,insert_sql,delete_sql from list_table
where tablename =v_tablename into v_count,v_create_sql,v_insert_sql,v_delete_sql;

IF v_count!=1 THEN
SET p_status=2,p_text='未纳入自动切分计划，请先录入！';
LEAVE label_a;
END    IF;

select count(1) from information_schema.tables
where table_name =v_tablename into v_count1;

IF v_count1!=1 THEN
SET p_status=3,p_text=CONCAT(v_tablename,'数据库中不存在，无法备份！');
LEAVE label_a;
END    IF;

set v_tablename_new= CONCAT(v_tablename,'_',date(NOW())+0);

select count(1) from table_backlog
where tablename =v_tablename_new into v_count2;

IF v_count2!=0 THEN
SET p_status=4,p_text=CONCAT(v_tablename,'已备份过！');
LEAVE label_a;
END    IF;

SET @sqlstr2=CONCAT('RENAME TABLE ',v_tablename,' TO ',v_tablename_new);

PREPARE stmt2 FROM @sqlstr2;
EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;

SET @sqlstr1=v_create_sql;

PREPARE stmt1 FROM @sqlstr1;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;

SET v_day=CONCAT("'",DATE_SUB(DATE(now()),INTERVAL 10 DAY),"'");
SET @sqlstr3=REPLACE(REPLACE(v_insert_sql,'sday',v_day),'tablename',v_tablename_new);

insert into error_log
value(1,@sqlstr3);

PREPARE stmt3 FROM @sqlstr3;
EXECUTE stmt3;
DEALLOCATE PREPARE stmt3;

SET @sqlstr4=REPLACE(REPLACE(v_delete_sql,'sday',v_day),'tablename',v_tablename_new);

insert into error_log
value(2,@sqlstr4);

PREPARE stmt4 FROM @sqlstr4;
EXECUTE stmt4;
DEALLOCATE PREPARE stmt4;

insert into table_backlog(tablename,source_tablename,amount_of_data,starttime,endtime)
values(v_tablename_new,v_tablename,0,v_starttime,NOW());

END;
COMMIT;
SET autocommit=1;
END