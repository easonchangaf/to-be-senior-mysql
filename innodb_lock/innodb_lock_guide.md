

# Cases
## case 1
IS,IX,S,X的基本示例
- 为表添加IS锁
- 为表添加IX锁
- 为行添加S锁
- 为行添加X锁
- 同一个事务，同一行的X和S兼容，即可重入

## case 2
表级别S和IX的互斥性质
- 使用 LOCK TABLES stu READ;  添加表锁
- 查询 performance_schema.metadata_locks 查看表锁
- 使用 unlock tables 来释放表锁