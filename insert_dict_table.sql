INSERT INTO `douzi_report`.`list_table` (`id`, `tablename`, `sub_table`, `create_sql`, `insert_sql`, `delete_sql`, `createtime`, `updatetime`, `status`) VALUES ('1', 'drilling_history', '0', 'CREATE TABLE `drilling_history` (\r\n  `report_date` date DEFAULT NULL,\r\n  `douzi_id` bigint(20) NOT NULL DEFAULT \'0\',\r\n  `douzi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT \'\',\r\n  `market_channel_id` int(11) NOT NULL DEFAULT \'0\',\r\n  `market_channel` varchar(64) DEFAULT NULL,\r\n  `user_site_id` bigint(20) NOT NULL DEFAULT \'0\',\r\n  `user_site` bigint(20) NOT NULL DEFAULT \'0\',\r\n  `gift_amount` decimal(54,0) DEFAULT NULL,\r\n  `login_user_count` decimal(63,0) DEFAULT NULL,\r\n  `market_amount` decimal(54,2) DEFAULT NULL,\r\n  `pay_amount` decimal(54,0) DEFAULT NULL,\r\n  `pay_user_count` decimal(63,0) DEFAULT NULL,\r\n  `redbag_amount` decimal(64,2) DEFAULT NULL,\r\n  `reg_active_user_count` decimal(63,0) DEFAULT NULL,\r\n  `reg_mac_count` decimal(63,0) DEFAULT NULL,\r\n  `reg_user_count` decimal(63,0) DEFAULT NULL,\r\n  `retention_15_count` decimal(63,0) DEFAULT NULL,\r\n  `retention_2_count` decimal(63,0) DEFAULT NULL,\r\n  `retention_7_count` decimal(63,0) DEFAULT NULL,\r\n  `retention_user_count` decimal(63,0) DEFAULT NULL,\r\n  UNIQUE KEY `idx_drilling_history_1109` (`report_date`,`douzi_id`,`douzi`,`market_channel_id`,`market_channel`,`user_site_id`,`user_site`)\r\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;', 'insert into drilling_history(report_date,douzi_id,douzi,market_channel_id,market_channel,user_site_id,user_site,gift_amount,login_user_count,market_amount,pay_amount,pay_user_count,redbag_amount,reg_active_user_count,reg_mac_count,reg_user_count,retention_15_count,retention_2_count,retention_7_count,retention_user_count)\r\nselect report_date,douzi_id,douzi,market_channel_id,market_channel,user_site_id,user_site,gift_amount,login_user_count,market_amount,pay_amount,pay_user_count,redbag_amount,reg_active_user_count,reg_mac_count,reg_user_count,retention_15_count,retention_2_count,retention_7_count,retention_user_count\r\n from tablename where report_date>=sday;\r\n', 'DELETE FROM tablename where report_date>=sday;', '2019-03-19 10:18:31', '2019-03-19 10:18:34', '0');