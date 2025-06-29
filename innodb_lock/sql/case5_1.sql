-- session 1 start
use innodb_lock;

-- step 1
START TRANSACTION;
SELECT * FROM stu WHERE id > 21 and id <= 30 FOR UPDATE;  -- 写临键锁，锁定记录10及间隙(5,7]

-- step 4
commit;