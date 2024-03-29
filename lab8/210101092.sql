create database week08;

-- Task 1

use week08;

-- drop database week08;

-- Task 2

-- Creating the tables

create table
    cs245_student(
        roll_number char(9),
        name char(100),
        reg_status char(20),
        audit_credit char(10),
        email char(50),
        phone char(8),
        primary key(roll_number)
    );

create table
    cs245_marks (
        roll_number char(9),
        marks int,
        primary key(roll_number),
        Foreign Key (roll_number) REFERENCES cs245_student(roll_number)
    );

create table
    cs245_grade (
        roll_number char(9),
        letter_grade char(2),
        primary key(roll_number),
        Foreign Key (roll_number) REFERENCES cs245_student(roll_number)
    );

create table
    cs246_student(
        roll_number char(9),
        name char(100),
        reg_status char(20),
        audit_credit char(10),
        email char(50),
        phone char(8),
        primary key(roll_number)
    );

create table
    cs246_marks (
        roll_number char(9),
        marks int,
        primary key(roll_number),
        Foreign Key (roll_number) REFERENCES cs246_student(roll_number)
    );

create table
    cs246_grade (
        roll_number char(9),
        letter_grade char(2),
        primary key(roll_number),
        Foreign Key (roll_number) REFERENCES cs246_student(roll_number)
    );

-- Task 3 : Loading the data into files using load command

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab8/cs245_student.csv' INTO
TABLE
    cs245_student FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab8/cs245_grade.csv' INTO
TABLE
    cs245_grade FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab8/cs245_marks.csv' INTO
TABLE
    cs245_marks FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab8/cs246_student.csv' INTO
TABLE
    cs246_student FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab8/cs246_grade.csv' INTO
TABLE
    cs246_grade FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab8/cs246_marks.csv' INTO
TABLE
    cs246_marks FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Task 4 a : The following query creates the user along with the passwords

create user headTA identified by 'Headta@1';

create user saradhi identified by 'Saradhi@1';

create user pbhaduri identified by 'Pbhaduri@1';

create user doaa identified by 'Doaa@111';

-- Task 5 a : This query grants the roles given in table to the users

grant select,insert,update on cs245_marks to headTA;

grant select,insert,update on cs246_marks to headTA;

grant select,update on cs246_grade to saradhi;

grant select,update on cs245_grade to pbhaduri;

grant select,insert,update,delete on cs245_student to doaa;

grant select,insert,update,delete on cs246_student to doaa;

-- Task 5 b

-- Task 5b 1

select marks from cs246_marks where roll_number='270123065';

--Output: 68

-- Task 5b 2

delete from cs245_marks where roll_number='270123065';

-- ERROR 1142 (42000): DELETE command denied to user 'headTA'@'localhost' for table 'cs245_marks'

-- Task 5b 3

delete from cs245_grade where roll_number=270101005;

-- ERROR 1142 (42000): DELETE command denied to user 'saradhi'@'localhost' for table 'cs245_grade'

delete from cs246_grade where roll_number=270101005;

-- ERROR 1142 (42000): DELETE command denied to user 'saradhi'@'localhost' for table 'cs246_grade'

-- Task 5b 4

update cs246_grade set letter_grade='BC' where roll_number=270101005;

-- Query OK, 1 row affected (0.10 sec)

-- Rows matched: 1  Changed: 1  Warnings: 0

-- Task 5b 5

update cs245_marks set marks=95 where roll_number=270101064;

-- ERROR 1142 (42000): UPDATE command denied to user 'pbhaduri'@'localhost' for table 'cs245_marks'

-- Task 5b 6

select letter_grade from cs245_grade where roll_number=270101064;

-- Output : FP

-- Task 5b 7

insert into cs245_student
values (
        '270123089',
        'Alex',
        'Aproved',
        'Credit',
        'alex@protonmail.com',
        '960-7830'
    );

-- Query OK, 1 row affected (0.12 sec)

-- Task 5b 8

insert into cs245_marks values ('270123089',67);

-- ERROR 1142 (42000): INSERT command denied to user 'doaa'@'localhost' for table 'cs245_marks'

-- Task 5b 9

update cs245_grade set letter_grade='DD' where roll_number=270101053;

-- ERROR 1142 (42000): UPDATE command denied to user 'saradhi'@'localhost' for table 'cs245_grade'

-- Task 5b 10

delete from cs246_grade
where
    roll_number in (
        270101004,
        270101019,
        270101029,
        270101039,
        270101049,
        270101059
    );

-- ERROR 1142 (42000): DELETE command denied to user 'pbhaduri'@'localhost' for table 'cs246_grade'

-- Task 6a : This query grants the roles according to the table

grant select(roll_number,name, email) on cs245_student to headTA;

grant select(roll_number,name, email) on cs246_student to headTA;

grant select(roll_number,name, email) on cs245_student to pbhaduri;

grant select(roll_number,name, email) on cs246_student to saradhi;

grant
select
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ),
insert
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ),
update
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ) on cs246_student to doaa;

show grants for doaa;

-- Task 6b

-- Task 6b 1

select email,phone from cs245_student where name='Craig Salazar';

-- ERROR 1143 (42000): SELECT command denied to user 'headTA'@'localhost' for column 'phone' in table 'cs245_student'

-- Task 6b 2

select roll_number, email
from cs245_student
where name = 'Lionel Battle';

-- +-------------+--------------+

-- | roll_number | email        |

-- +-------------+--------------+

-- | 270101015   | quis@aol.edu |

-- +-------------+--------------+

-- 1 row in set (0.00 sec)

-- Task 6b 3

delete from cs246_student where name='Jenette Parks';

-- ERROR 1142 (42000): DELETE command denied to user 'headTA'@'localhost' for table 'cs246_student'

-- Task 6b 4

update cs246_student
set email = 'jparks@aol.ca'
where name = 'Jenette Parks';

-- ERROR 1142 (42000): UPDATE command denied to user 'headTA'@'localhost' for table 'cs246_student'

-- Task 6b 5

update cs246_student
set roll_number = 290101051
where roll_number = 270101051;

-- ERROR 1142 (42000): UPDATE command denied to user 'saradhi'@'localhost' for table 'cs246_student'

-- Task 6b 6

select email, marks
from cs246_student
    natural join cs246_marks
where 'Garrison Donovan';

-- ERROR 1143 (42000): SELECT command denied to user 'saradhi'@'localhost' in table 'cs246_marks'

-- Task 6b 7

update cs245_student
set
    reg_status = 'Approved',
    audit_credit = 'Audit'
where email like "%icloud.couk";

-- ERROR 1142 (42000): UPDATE command denied to user 'pbhaduri'@'localhost' for table 'cs245_student'

-- Task 6b 8

select email, letter_grade
from cs245_student
    natural join cs245_grade
where name = 'Benedict Warren';

-- +--------------------------+--------------+

-- | email                    | letter_grade |

-- +--------------------------+--------------+

-- | posuere.cubilia@yahoo.ca | CD           |

-- +--------------------------+--------------+

-- 1 row in set (0.00 sec)

-- Task 6b 9

insert into
    cs246_student(
        roll_number,
        name,
        reg_status,
        phone
    )
values (
        270123436,
        'Anjali',
        'Pending',
        8445838
    );

-- Query OK, 1 row affected (0.10 sec)

-- Task 6b 10

update cs245_student
set audit_credit = 'Audit'
where
    email = 'semper.tellus.id@google.net';

-- Query OK, 1 row affected (0.10 sec)

-- Rows matched: 1  Changed: 1  Warnings: 0

-- Task 7

-- Task 7 a

CREATE VIEW V1 AS 
	select
	    roll_number,
	    name,
	    email,
	    letter_grade
	from cs246_student
	    natural join
CS246_GRADE; 

-- ERROR 1142 (42000): CREATE VIEW command denied to user 'saradhi'@'localhost' for table 'v1'

-- Task 7 b

CREATE VIEW V2 AS 
	select
	    roll_number,
	    name,
	    email,
	    marks
	from cs245_student
	    natural join
CS245_MARKS; 

-- ERROR 1142 (42000): CREATE VIEW command denied to user 'headTA'@'localhost' for table 'v2'

-- Task 7 c

CREATE VIEW V3 AS 
	select
	    roll_number,
	    name,
	    email,
	    letter_grade
	from cs245_student
	    natural join
CS245_GRADE; 

-- ERROR 1142 (42000): CREATE VIEW command denied to user 'headTA'@'localhost' for table 'v3'

-- Task 7 d

DELETE from view1 where email='quisque.porttitor@google.couk';

--DELETE command denied to user 'saradhi'@'localhost' for table 'view1'

update view3 set letter_grade='AA' where name='Zenaida Fleming';

--UPDATE command denied to user 'headTA'@'localhost' for table 'view3'

-- Task 8

grant select,update on cs246_grade to saradhi with grant option;

grant select on cs246_grade to headTA;

-- Query OK, 0 rows affected (0.11 sec)

select
    roll_number,
    name,
    email,
    marks,
    letter_grade
from cs246_student
    natural join cs246_marks
    natural join cs246_grade;

-- 206 rows in set (0.00 sec)

-- Task 9

REVOKE SELECT ON cs246_grade FROM headTA;

-- Query OK, 0 rows affected (0.16 sec)

SELECT
    roll_number,
    name,
    email,
    marks,
    letter_grade
FROM cs246_student
    NATURAL JOIN cs246_marks
    NATURAL JOIN cs246_grade;

-- ERROR 1142 (42000): SELECT command denied to user 'headTA'@'localhost' for table 'cs246_grade'

REVOKE
SELECT
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ),
INSERT
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ),
UPDATE
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ) ON cs246_student
FROM doaa;

-- ERROR 1142 (42000): GRANT command denied to user 'doaa'@'localhost' for table 'cs246_student'

-- Task 09 d

REVOKE
SELECT
(roll_number, name, email) ON cs245_student
FROM headTA;

REVOKE SELECT(roll_number,name,email) ON cs246_student FROM headTA;

REVOKE SELECT(roll_number,name,email) ON cs245_student FROM pbhaduri;

REVOKE SELECT(roll_number,name,email) ON cs246_student FROM saradhi;

REVOKE
SELECT
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ),
INSERT
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ),
UPDATE
(
        roll_number,
        name,
        reg_status,
        audit_credit
    ) ON cs246_student
FROM "doaa";

-- Task 9e

REVOKE SELECT, INSERT, UPDATE ON cs245_marks FROM headTA;

REVOKE SELECT, INSERT, UPDATE ON cs246_marks FROM headTA;

REVOKE SELECT, UPDATE ON cs246_grade FROM saradhi;

REVOKE SELECT, UPDATE ON cs245_grade FROM pbhaduri;

REVOKE SELECT, INSERT, UPDATE, DELETE ON cs245_student FROM doaa;

REVOKE SELECT, INSERT, UPDATE, DELETE ON cs246_student FROM doaa;

-- Task 10

DROP USER headTA;

DROP USER saradhi;

DROP USER pbhaduri;

DROP USER doaa;

use mysql;

select User from user;

-- +------------------+

-- | User             |

-- +------------------+

-- | debian-sys-maint |

-- | mysql.infoschema |

-- | mysql.session    |

-- | mysql.sys        |

-- | root             |

-- +------------------+

-- 5 rows in set (0.00 sec)