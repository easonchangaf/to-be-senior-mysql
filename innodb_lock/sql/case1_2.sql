-- start
use innodb_lock;

-- step 2


-- 查看锁状态，可以看到 lock_data = 1，表示1被锁了
-- lock_type 为 record，lock_mode 为 S,REC_NOT_GAP 表示添加了行级别读锁
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;


-- step 4

-- 查看锁状态，可以新增的看到 lock_data = 5，表示5被锁了
-- lock_type 为 record，lock_mode 为 X,REC_NOT_GAP 表示添加了行级别写锁
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;

-- step 6
-- 查看锁状态，可以新增的看到 lock_data = 1，且id=1的记录被同一事物添加了写锁了
-- 注意，ENGINE_TRANSACTION_ID 都为 3371，同一个事物，同一行记录的读写锁兼容，可重入
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;