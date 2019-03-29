CREATE TABLE `list_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_table` int(11) NOT NULL,
  `create_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '建表语句',
  `insert_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '回迁数据sql',
  `delete_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '删除冗余数据',
  `createtime` datetime NOT NULL,
  `updatetime` timestamp NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0未部署，1上线，2下线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;