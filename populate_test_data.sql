CREATE  PROCEDURE `test_pro_prefetch`(in p_a int,in p_day date)
BEGIN
DECLARE v_a int DEFAULT 0;
DECLARE v_l int DEFAULT 0;
DECLARE v_day date DEFAULT '1900-01-01';
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
show ERRORS;
ROLLBACK;
SET autocommit=1;
END;
set autocommit=0;
lable_a:begin
select ifnull(max(market_channel_id),1) from drilling_history into v_l;
set    v_l=v_l+1;
SET v_a=p_a;
SET v_day=p_day;
WHILE v_l<v_a DO
INSERT INTO drilling_history(`report_date`, `douzi_id`, `douzi`, `market_channel_id`, `market_channel`, `user_site_id`, `user_site`, `gift_amount`, `login_user_count`, `market_amount`, `pay_amount`, `pay_user_count`, `redbag_amount`, `reg_active_user_count`, `reg_mac_count`, `reg_user_count`, `retention_15_count`, `retention_2_count`, `retention_7_count`, `retention_user_count`)
VALUES (v_day, '0', 'È«²¿', v_l, 'ÆÎÌï-¹Ù·½ÍøÕ¾', '15', '15', '356', '2721', '0.00', '7162', '142', '3584.00', '16', '8', '45', '0', '16', '0', '45');
set v_l=v_l+1;
END WHILE;
END;
COMMIT;
set autocommit=1;
end