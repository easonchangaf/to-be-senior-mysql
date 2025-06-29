-- session 2 start
use innodb_lock;


-- step 2 check
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;


-- step 3 id > 21 and id <= 30，锁住的范围: (20, 25], (25, 30]
begin;
select * from stu where id = 30 for update ; -- 数据存在，阻塞
commit;

begin;
select * from stu where id = 29 for update ; -- 数据不存在，不阻塞
commit;

begin;
insert into stu(id, name) values (29, '张三'); -- 阻塞
commit;

begin;
select * from stu where id = 20 for update ; -- 数据存在，不阻塞
commit;