-- start
use innodb_lock;

-- step 1：开始并获取表级S锁
START TRANSACTION;
LOCK TABLES stu READ;  -- 对stu表加表级S锁（共享锁）

-- step 4
unlock tables ;

SELECT
*
FROM performance_schema.metadata_locks where OBJECT_TYPE='TABLE' and OBJECT_NAME = 'stu';
