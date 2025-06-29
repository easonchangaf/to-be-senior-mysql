create database if not exists innodb_lock;

use innodb_lock;

CREATE TABLE IF NOT EXISTS stu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    age TINYINT UNSIGNED,
    INDEX idx_age (age)
);


INSERT INTO stu (id, name, age) VALUES (1, 'javascript', 30);
INSERT INTO stu (id, name, age) VALUES (5, 'java', 30);
INSERT INTO stu (id, name, age) VALUES (7, 'php', 20);
INSERT INTO stu (id, name, age) VALUES (8, 'python', 20);
INSERT INTO stu (id, name, age) VALUES (9, 'swift', 20);
INSERT INTO stu (id, name, age) VALUES (13, 'c++', 50);
INSERT INTO stu (id, name, age) VALUES (20, 'c', 60);
