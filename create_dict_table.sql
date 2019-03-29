CREATE TABLE `list_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_table` int(11) NOT NULL,
  `create_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '�������',
  `insert_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '��Ǩ����sql',
  `delete_sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'ɾ����������',
  `createtime` datetime NOT NULL,
  `updatetime` timestamp NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0δ����1���ߣ�2����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;