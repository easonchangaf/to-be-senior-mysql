-- 查看锁情况
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;