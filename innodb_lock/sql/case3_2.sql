-- session 2 start
use innodb_lock;

-- step 2 check
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;

-- step 3 被阻塞
insert into stu(id, name, age) values (6, '666', 6);

-- step 5 写成功
select * from stu where id = 6;

-- step 7 check
select ENGINE_TRANSACTION_ID, OBJECT_SCHEMA, OBJECT_NAME, index_name, LOCK_TYPE, LOCK_MODE, LOCK_DATA
from performance_schema.data_locks;

-- step 8 被阻塞
begin;
insert into stu(id, name, age) values (2, '2', 2);

-- step 10 写成功
select * from stu where id = 2;





-- end

delete from stu where id = 6;
delete from stu where id = 2;
