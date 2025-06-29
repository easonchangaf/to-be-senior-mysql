-- session 1 start
use innodb_lock;


-- step 1
-- 注意，锁的条件是 id < 10, 目前存在的id是1,5,7,8,9,13,20，并没有10，
-- 这里会添加间隙锁，被锁的范围是 id < 13的范围

begin;
select * from stu where id < 10 for share;

-- step 4
commit;

-- new transaction
-- step 6
begin;
select * from stu where id <= 13 for update;

-- step 9
commit;