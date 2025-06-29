-- 查看行级别锁情况
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;

-- 查看表级别锁情况
SELECT *
FROM performance_schema.metadata_locks where OBJECT_TYPE='TABLE'