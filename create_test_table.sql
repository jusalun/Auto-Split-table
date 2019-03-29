#test table
CREATE TABLE `drilling_history` (
  `report_date` date DEFAULT NULL,
  `douzi_id` bigint(20) NOT NULL DEFAULT '0',
  `douzi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `market_channel_id` int(11) NOT NULL DEFAULT '0',
  `market_channel` varchar(64) DEFAULT NULL,
  `user_site_id` bigint(20) NOT NULL DEFAULT '0',
  `user_site` bigint(20) NOT NULL DEFAULT '0',
  `gift_amount` decimal(54,0) DEFAULT NULL,
  `login_user_count` decimal(63,0) DEFAULT NULL,
  `market_amount` decimal(54,2) DEFAULT NULL,
  `pay_amount` decimal(54,0) DEFAULT NULL,
  `pay_user_count` decimal(63,0) DEFAULT NULL,
  `redbag_amount` decimal(64,2) DEFAULT NULL,
  `reg_active_user_count` decimal(63,0) DEFAULT NULL,
  `reg_mac_count` decimal(63,0) DEFAULT NULL,
  `reg_user_count` decimal(63,0) DEFAULT NULL,
  `retention_15_count` decimal(63,0) DEFAULT NULL,
  `retention_2_count` decimal(63,0) DEFAULT NULL,
  `retention_7_count` decimal(63,0) DEFAULT NULL,
  `retention_user_count` decimal(63,0) DEFAULT NULL,
  UNIQUE KEY `idx_drilling_history_1109` (`report_date`,`douzi_id`,`douzi`,`market_channel_id`,`market_channel`,`user_site_id`,`user_site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


