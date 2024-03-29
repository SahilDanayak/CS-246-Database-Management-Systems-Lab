-- Active: 1675068196296@@127.0.0.1@3306@week11

-- drop database week10;

-- Task 1
drop database week11;
create database week11;

use week11;

-- Task 2

create table emp_boss_small(
    ename char(50),
    bname char(50),
    primary key(ename,bname)
);

create table emp_boss_large(
    ename char(50),
    bname char(50),
    primary key(ename,bname)
);

-- Output

-- create table emp_boss_small( ename char(50), bname char(50), primary key(ename,bname) )

-- AffectedRows : 0

-- create table emp_boss_large( ename char(50), bname char(50), primary key(ename,bname) )

-- AffectedRows : 0


-- Task 3

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab11/week-11-emp_small.csv' INTO
TABLE
    emp_boss_small FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab11/week-11-emp_large.csv' INTO
TABLE
    emp_boss_large FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Output

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab11/week-11-emp_small.csv' INTO TABLE emp_boss_small FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS
-- AffectedRows : 13
-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab11/week-11-emp_large.csv' INTO TABLE emp_boss_large FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS
-- AffectedRows : 49


-- Task 4


DELIMITER &&  
CREATE PROCEDURE sp2 (IN ename char(50),IN data_size char(20))  
BEGIN  
    if (data_size='emp_boss_small') then
        create table if not EXISTS output_small(empname char(50), boss char(50));
        set @emp=ename;
        while ((select bname from emp_boss_small where emp_boss_small.ename=@emp)!="NA") DO 
            INSERT INTO output_small value(ename,(select bname from emp_boss_small where emp_boss_small.ename=@emp));
            -- OR INSERT INTO output_small select ename,bname from emp_boss_small where ename=@emp;
            set @emp=(select bname from emp_boss_small where emp_boss_small.ename=@emp);
        end while; 
    else
        create table if not EXISTS output_large(empname char(50), boss char(50));
        set @emp=ename;
        while ((select bname from emp_boss_large where emp_boss_large.ename=@emp)!="NA") DO 
            INSERT INTO output_large value(ename,(select bname from emp_boss_large where emp_boss_large.ename=@emp));
            set @emp=(select bname from emp_boss_large where emp_boss_large.ename=@emp);
        end while; 
    end if;
END &&  
DELIMITER ;  

-- Task 5



CALL sp2 ("Employee 01","emp_boss_small");
CALL sp2 ("Employee 02","emp_boss_small");
CALL sp2 ("Employee 03","emp_boss_small");
CALL sp2 ("Employee 04","emp_boss_small");
CALL sp2 ("Employee 05","emp_boss_small");
CALL sp2 ("Employee 06","emp_boss_small");
CALL sp2 ("Employee 07","emp_boss_small");
CALL sp2 ("Employee 08","emp_boss_small");
CALL sp2 ("Employee 09","emp_boss_small");
CALL sp2 ("Employee 10","emp_boss_small");
CALL sp2 ("Employee 11","emp_boss_small");
CALL sp2 ("Employee 12","emp_boss_small");
CALL sp2 ("Employee 13","emp_boss_small");

-- Output

-- +-------------+-------------+
-- | empname     | boss        |
-- +-------------+-------------+
-- | Employee 02 | Employee 01 |
-- | Employee 03 | Employee 02 |
-- | Employee 03 | Employee 01 |
-- | Employee 04 | Employee 03 |
-- | Employee 04 | Employee 02 |
-- | Employee 04 | Employee 01 |
-- | Employee 05 | Employee 02 |
-- | Employee 05 | Employee 01 |
-- | Employee 06 | Employee 05 |
-- | Employee 06 | Employee 02 |
-- | Employee 06 | Employee 01 |
-- | Employee 07 | Employee 05 |
-- | Employee 07 | Employee 02 |
-- | Employee 07 | Employee 01 |
-- | Employee 08 | Employee 02 |
-- | Employee 08 | Employee 01 |
-- | Employee 09 | Employee 02 |
-- | Employee 09 | Employee 01 |
-- | Employee 10 | Employee 01 |
-- | Employee 11 | Employee 10 |
-- | Employee 11 | Employee 01 |
-- | Employee 12 | Employee 10 |
-- | Employee 12 | Employee 01 |
-- | Employee 13 | Employee 01 |
-- +-------------+-------------+
-- 24 rows in set (0.00 sec)


-- Task 6


CALL sp2 ("Employee 01","emp_boss_large");
CALL sp2 ("Employee 02","emp_boss_large");
CALL sp2 ("Employee 03","emp_boss_large");
CALL sp2 ("Employee 04","emp_boss_large");
CALL sp2 ("Employee 05","emp_boss_large");
CALL sp2 ("Employee 06","emp_boss_large");
CALL sp2 ("Employee 07","emp_boss_large");
CALL sp2 ("Employee 08","emp_boss_large");
CALL sp2 ("Employee 09","emp_boss_large");
CALL sp2 ("Employee 10","emp_boss_large");
CALL sp2 ("Employee 11","emp_boss_large");
CALL sp2 ("Employee 12","emp_boss_large");
CALL sp2 ("Employee 13","emp_boss_large");
CALL sp2 ("Employee 14","emp_boss_large");
CALL sp2 ("Employee 15","emp_boss_large");
CALL sp2 ("Employee 16","emp_boss_large");
CALL sp2 ("Employee 17","emp_boss_large");
CALL sp2 ("Employee 18","emp_boss_large");
CALL sp2 ("Employee 19","emp_boss_large");
CALL sp2 ("Employee 20","emp_boss_large");
CALL sp2 ("Employee 21","emp_boss_large");
CALL sp2 ("Employee 22","emp_boss_large");
CALL sp2 ("Employee 23","emp_boss_large");
CALL sp2 ("Employee 24","emp_boss_large");
CALL sp2 ("Employee 25","emp_boss_large");
CALL sp2 ("Employee 26","emp_boss_large");
CALL sp2 ("Employee 27","emp_boss_large");
CALL sp2 ("Employee 28","emp_boss_large");
CALL sp2 ("Employee 29","emp_boss_large");
CALL sp2 ("Employee 30","emp_boss_large");
CALL sp2 ("Employee 31","emp_boss_large");
CALL sp2 ("Employee 32","emp_boss_large");
CALL sp2 ("Employee 33","emp_boss_large");
CALL sp2 ("Employee 34","emp_boss_large");
CALL sp2 ("Employee 35","emp_boss_large");
CALL sp2 ("Employee 36","emp_boss_large");
CALL sp2 ("Employee 37","emp_boss_large");
CALL sp2 ("Employee 38","emp_boss_large");
CALL sp2 ("Employee 39","emp_boss_large");
CALL sp2 ("Employee 40","emp_boss_large");
CALL sp2 ("Employee 41","emp_boss_large");
CALL sp2 ("Employee 42","emp_boss_large");
CALL sp2 ("Employee 43","emp_boss_large");
CALL sp2 ("Employee 44","emp_boss_large");
CALL sp2 ("Employee 45","emp_boss_large");
CALL sp2 ("Employee 46","emp_boss_large");
CALL sp2 ("Employee 47","emp_boss_large");
CALL sp2 ("Employee 48","emp_boss_large");
CALL sp2 ("Employee 49","emp_boss_large");

-- Output

-- +-------------+-------------+
-- | empname     | boss        |
-- +-------------+-------------+
-- | Employee 02 | Employee 01 |
-- | Employee 03 | Employee 02 |
-- | Employee 03 | Employee 01 |
-- | Employee 04 | Employee 03 |
-- | Employee 04 | Employee 02 |
-- | Employee 04 | Employee 01 |
-- | Employee 05 | Employee 02 |
-- | Employee 05 | Employee 01 |
-- | Employee 06 | Employee 05 |
-- | Employee 06 | Employee 02 |
-- | Employee 06 | Employee 01 |
-- | Employee 07 | Employee 06 |
-- | Employee 07 | Employee 05 |
-- | Employee 07 | Employee 02 |
-- | Employee 07 | Employee 01 |
-- | Employee 08 | Employee 06 |
-- | Employee 08 | Employee 05 |
-- | Employee 08 | Employee 02 |
-- | Employee 08 | Employee 01 |
-- | Employee 09 | Employee 06 |
-- | Employee 09 | Employee 05 |
-- | Employee 09 | Employee 02 |
-- | Employee 09 | Employee 01 |
-- | Employee 10 | Employee 06 |
-- | Employee 10 | Employee 05 |
-- | Employee 10 | Employee 02 |
-- | Employee 10 | Employee 01 |
-- | Employee 11 | Employee 05 |
-- | Employee 11 | Employee 02 |
-- | Employee 11 | Employee 01 |
-- | Employee 12 | Employee 11 |
-- | Employee 12 | Employee 05 |
-- | Employee 12 | Employee 02 |
-- | Employee 12 | Employee 01 |
-- | Employee 13 | Employee 11 |
-- | Employee 13 | Employee 05 |
-- | Employee 13 | Employee 02 |
-- | Employee 13 | Employee 01 |
-- | Employee 14 | Employee 11 |
-- | Employee 14 | Employee 05 |
-- | Employee 14 | Employee 02 |
-- | Employee 14 | Employee 01 |
-- | Employee 15 | Employee 11 |
-- | Employee 15 | Employee 05 |
-- | Employee 15 | Employee 02 |
-- | Employee 15 | Employee 01 |
-- | Employee 16 | Employee 05 |
-- | Employee 16 | Employee 02 |
-- | Employee 16 | Employee 01 |
-- | Employee 17 | Employee 16 |
-- | Employee 17 | Employee 05 |
-- | Employee 17 | Employee 02 |
-- | Employee 17 | Employee 01 |
-- | Employee 18 | Employee 16 |
-- | Employee 18 | Employee 05 |
-- | Employee 18 | Employee 02 |
-- | Employee 18 | Employee 01 |
-- | Employee 19 | Employee 16 |
-- | Employee 19 | Employee 05 |
-- | Employee 19 | Employee 02 |
-- | Employee 19 | Employee 01 |
-- | Employee 20 | Employee 05 |
-- | Employee 20 | Employee 02 |
-- | Employee 20 | Employee 01 |
-- | Employee 21 | Employee 02 |
-- | Employee 21 | Employee 01 |
-- | Employee 22 | Employee 21 |
-- | Employee 22 | Employee 02 |
-- | Employee 22 | Employee 01 |
-- | Employee 23 | Employee 02 |
-- | Employee 23 | Employee 01 |
-- | Employee 24 | Employee 01 |
-- | Employee 25 | Employee 24 |
-- | Employee 25 | Employee 01 |
-- | Employee 26 | Employee 25 |
-- | Employee 26 | Employee 24 |
-- | Employee 26 | Employee 01 |
-- | Employee 27 | Employee 24 |
-- | Employee 27 | Employee 01 |
-- | Employee 28 | Employee 01 |
-- | Employee 29 | Employee 28 |
-- | Employee 29 | Employee 01 |
-- | Employee 30 | Employee 29 |
-- | Employee 30 | Employee 28 |
-- | Employee 30 | Employee 01 |
-- | Employee 31 | Employee 30 |
-- | Employee 31 | Employee 29 |
-- | Employee 31 | Employee 28 |
-- | Employee 31 | Employee 01 |
-- | Employee 32 | Employee 30 |
-- | Employee 32 | Employee 29 |
-- | Employee 32 | Employee 28 |
-- | Employee 32 | Employee 01 |
-- | Employee 33 | Employee 30 |
-- | Employee 33 | Employee 29 |
-- | Employee 33 | Employee 28 |
-- | Employee 33 | Employee 01 |
-- | Employee 34 | Employee 29 |
-- | Employee 34 | Employee 28 |
-- | Employee 34 | Employee 01 |
-- | Employee 35 | Employee 34 |
-- | Employee 35 | Employee 29 |
-- | Employee 35 | Employee 28 |
-- | Employee 35 | Employee 01 |
-- | Employee 36 | Employee 29 |
-- | Employee 36 | Employee 28 |
-- | Employee 36 | Employee 01 |
-- | Employee 37 | Employee 29 |
-- | Employee 37 | Employee 28 |
-- | Employee 37 | Employee 01 |
-- | Employee 38 | Employee 28 |
-- | Employee 38 | Employee 01 |
-- | Employee 39 | Employee 38 |
-- | Employee 39 | Employee 28 |
-- | Employee 39 | Employee 01 |
-- | Employee 40 | Employee 38 |
-- | Employee 40 | Employee 28 |
-- | Employee 40 | Employee 01 |
-- | Employee 41 | Employee 28 |
-- | Employee 41 | Employee 01 |
-- | Employee 42 | Employee 41 |
-- | Employee 42 | Employee 28 |
-- | Employee 42 | Employee 01 |
-- | Employee 43 | Employee 42 |
-- | Employee 43 | Employee 41 |
-- | Employee 43 | Employee 28 |
-- | Employee 43 | Employee 01 |
-- | Employee 44 | Employee 41 |
-- | Employee 44 | Employee 28 |
-- | Employee 44 | Employee 01 |
-- | Employee 45 | Employee 44 |
-- | Employee 45 | Employee 41 |
-- | Employee 45 | Employee 28 |
-- | Employee 45 | Employee 01 |
-- | Employee 46 | Employee 41 |
-- | Employee 46 | Employee 28 |
-- | Employee 46 | Employee 01 |
-- | Employee 47 | Employee 41 |
-- | Employee 47 | Employee 28 |
-- | Employee 47 | Employee 01 |
-- | Employee 48 | Employee 28 |
-- | Employee 48 | Employee 01 |
-- | Employee 49 | Employee 01 |
-- +-------------+-------------+
-- 143 rows in set (0.00 sec)



select * from output_small;

select * from output_large;
