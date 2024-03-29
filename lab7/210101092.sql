-- Active: 1675068196296@@127.0.0.1@3306@week07

create database week07;

-- Task 1

use week07;

-- drop table allowable_letter_grade;

-- drop table course18a;

-- drop table course18b;

-- drop table course18e;

-- drop table course18f;

-- drop table grade18a;

-- drop table grade18b;

-- drop table grade18f;

-- drop table student18a;

-- drop table student18c;

-- drop table student18d;

-- drop table student18f;

-- drop view view1;

-- drop view view2;

-- drop view view3;

-- drop view v;

-- Task 2

create table
    student18a (
        name char(100),
        roll_number char(10),
        primary key(roll_number)
    );

create table
    course18a(
        semester int,
        cid char(7),
        name char(100),
        l int,
        t int,
        p int,
        c int,
        primary key(cid)
    );

create table
    grade18a (
        roll_number char(10),
        cid char(7),
        letter_grade char(2),
        primary key(roll_number, cid)
    );

-- Task 3

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/student18.csv' INTO
TABLE
    student18a FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/course18.csv' INTO
TABLE
    course18a FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/grade18.csv' INTO
TABLE
    grade18a FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Task 4 a

CREATE VIEW VIEW1 AS 
	select
	    roll_number,
	    cid,
	    letter_grade
	from grade18a
	where cid like
'%M'; 

select * from view1;

insert into grade18a VALUES ('180101000','CS101','AB');

select * from view1 where roll_number=180101000;

-- Yes, the biew also needs to be updated

-- Task 4 b

CREATE VIEW VIEW2 AS 
	select distinct cid,letter_grade from 
GRADE18A; 

select * from view2;

insert into view2 values ('CS101','PM');

-- view is not updatable, as it should not have any function, aggregate or distinct in specification

-- It should not have distinct specification in select clause

-- Task 4 c

CREATE VIEW VIEW3 AS 
	select
	    cid,
	    letter_grade,
	    COUNT(roll_number) as "Number of Students"
	from grade18a
	group by cid, l
LETTER_GRADE; 

select * from view3;

insert into view3 values ('CS101','NP',17);

-- view is not updatable, as it should not have any function, aggregate or distinct in specification

-- It should not have aggregate function count in select clause

-- Task 5 a

-- create table course18b(

--     semester ENUM('1','2','3','4','5','6','7','8'),

--     cid char(7),

--     name char(100),

--     l int,

--     t int,

--     p int,

--     c int,

--     primary key(cid)

-- );

-- OR

create table
    course18b(
        semester INT,
        cid char(7),
        name char(100),
        l int,
        t int,
        p int,
        c int,
        primary key(cid),
        check (
            semester < 9
            and semester > 0
        )
    );

insert into course18b
values (
        10,
        'CS777',
        'Introduction to Chat GPT',
        3,
        0,
        0,
        6
    );

-- The constraint is honored

-- Check constraint 'course18b_chk_1' is violated.

-- Task 5b

create table
    allowable_letter_grade (
        grade char(2),
        value int,
        primary key(grade)
    );

insert INTO allowable_letter_grade VALUES ("AS",10);

insert INTO allowable_letter_grade VALUES ("AA",10);

insert INTO allowable_letter_grade VALUES ("AB",9);

insert INTO allowable_letter_grade VALUES ("BB",8);

insert INTO allowable_letter_grade VALUES ("BC",7);

insert INTO allowable_letter_grade VALUES ("CC",6);

insert INTO allowable_letter_grade VALUES ("CD",5);

insert INTO allowable_letter_grade VALUES ("DD",4);

insert INTO allowable_letter_grade VALUES ("FP",0);

insert INTO allowable_letter_grade VALUES ("FA",0);

insert INTO allowable_letter_grade VALUES ("NP",0);

insert INTO allowable_letter_grade VALUES ("PP",0);

insert INTO allowable_letter_grade VALUES ("I",0);

insert INTO allowable_letter_grade VALUES ("X",0);

SELECT * FROM allowable_letter_grade;

-- Task 5c

create table
    grade18b (
        roll_number char(10),
        cid char(7),
        letter_grade char(2),
        primary key(roll_number, cid),
        Foreign Key (letter_grade) REFERENCES allowable_letter_grade(grade) -- CHECK (letter_grade in ('AS','AA','AB','BB','BC','CC','CD','DD','FP','FA','NP','PP','I','X'))
    );

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/grade18.csv' INTO
TABLE
    grade18b FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

update grade18b
set letter_grade = 'MP'
where
    cid = 'XX102M'
    AND letter_grade = 'DD';

-- Check constraint 'grade18b_chk_1' is violated.

-- -- Cannot add or update a child row: a foreign key constraint fails (`week07`.`grade18b`, CONSTRAINT `grade18b_ibfk_1` FOREIGN KEY (`letter_grade`) REFERENCES `allowable_letter_grade` (`grade`))

-- Error: letter grade is not in allowable letter grade which acts as a foreign key constraint

-- Task 6 a

create table
    student18c (
        name char(100),
        roll_number char(10),
        constraint new_pkey primary key(roll_number)
    );

-- Task 6 b

create table
    grade18c (
        roll_number char(10),
        cid char(7),
        letter_grade char(2),
        constraint my_favourite_key primary key(roll_number, cid),
        constraint videshi_key Foreign Key (roll_number) REFERENCES student18c(roll_number)
    );

-- Task 6 c

alter table grade18c drop constraint videshi_key;

-- Task 7 a

create table
    student18d (
        name char(100),
        roll_number char(10),
        primary key(roll_number)
    );

-- Task 7 b

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/student18.csv' INTO
TABLE
    student18d FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Task 7 c

select
    sum(
        cast(roll_number as unsigned int)
    ) as "SUM",
    min(
        cast(roll_number as unsigned int)
    ) as "Minimum",
    max(
        cast(roll_number as unsigned int)
    ) as "Maximum",
    avg(
        cast(roll_number as unsigned int)
    ) as "Average"
from student18d;

-- Task 7 d

select
    cast(roll_number as DateTime) as "New Numbers"
from student18d;

-- Task 8 a

-- ALL IN ONE :create table course18e as (select * from course18a);

create table course18e like course18a;

-- Task 8 b

insert into course18e (select * from course18a);

select * from course18e;

-- Task 9 a

create table
    student18f (
        roll_number char(10),
        name char(100),
        redundant01 int DEFAULT 10,
        primary key(roll_number)
    );

create table
    course18f(
        semester int,
        cid char(7),
        name char(100),
        l int,
        t int,
        p int,
        c int,
        primary key(cid),
        redundant01 int default 10
    );

create table
    grade18f (
        roll_number char(10),
        cid char(7),
        letter_grade char(2),
        redundant01 int default 10,
        primary key(roll_number, cid)
    );

-- Task 9 b

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/student18.csv' INTO
TABLE
    student18f FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (name, roll_number);

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/course18.csv' INTO
TABLE
    course18f FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (semester, cid, name, l, t, p, c);

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/grade18.csv' INTO
TABLE
    grade18f FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (roll_number, cid, letter_grade);

select * from grade18f;

-- Task 9c

select
    student18f.roll_number,
    student18f.name,
    grade18f.letter_grade
from (
        grade18f
        JOIN student18f USING (roll_number)
    )
    JOIN course18f USING (cid)
where l = 3 and t = 1 and p = 0 and c = 8;

-- Task 9d

delete from grade18f;

-- Task 9e

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab7/cs570.csv' INTO
TABLE
    grade18f FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (roll_number, cid, letter_grade);

-- Task 9f

select
    roll_number,
    name,
    letter_grade
from student18f
    join grade18f using (roll_number);