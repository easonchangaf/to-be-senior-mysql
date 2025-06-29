-- start
use innodb_lock;

-- step 2
-- lock_type: shared_read_only
SELECT
*
FROM performance_schema.metadata_locks where OBJECT_TYPE='TABLE' and OBJECT_NAME = 'stu';

-- step 3
-- 开始并尝试获取IX锁
START TRANSACTION;
-- 尝试对id=1的行加X锁（需先获取表级IX锁） 被阻塞
SELECT * FROM stu WHERE id = 1 FOR UPDATE;

-- step 5
-- session 1执行 unlock tables后，获取到IX 和 行X锁
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;

-- end
commit