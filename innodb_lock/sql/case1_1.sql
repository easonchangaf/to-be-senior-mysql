-- start
use innodb_lock;
begin;

-- step 1
-- 添加IS锁，为id = 1 的行添加S锁

select * from stu where id = 1 for share;

-- step 3
-- 添加X锁
select * from stu where id = 5 for update;

-- step 5
-- 为 id=1的记录添加x锁，可以锁成功，因为是同一个事物，可重入
select * from stu where id = 1 for update;


-- end
commit;



