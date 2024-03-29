-- Active: 1675068196296@@127.0.0.1@3306@week05
create database week05;

-- AffectedRows : 1

-- Task1

use week05;

-- Task2

create table student (
    cid char(7),
    roll_number char(10),
    name char(100) NOT NULL,
    approval_status ENUM('Approved','Pending'),
    credit_status ENUM('Credit','Audit'),
    primary key(roll_number,cid)
);

-- AffectedRows : 0

create table course(
    cid char(7),
    name char(100) NOT NULL,
    primary key(cid)
);

-- AffectedRows : 0

create table credit (
    cid char(7),
    l int NOT NULL,
    t int NOT NULL,
    p int NOT NULL,
    c float NOT NULL,
    primary key(cid)
);

-- AffectedRows : 0

-- Task 3

LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab5/students-credits.csv' INTO TABLE student
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab5/courses.csv' INTO TABLE course
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab5/credits.csv' INTO TABLE credit
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Task 4

select * from student where name='Adarsh Kumar Udai';

select cid,name,credit_status from student where cid='EE 390' and credit_status='Credit';

select cid,roll_number,credit_status,approval_status from student where approval_status='Pending' and credit_status='Credit';

select cid,l,t,p,c from credit where c!=6;

select roll_number,name,cid,credit_status,approval_status from student where approval_status='Approved' and credit_status='Audit';



-- Task 5

select name,l,t,p,c from course,credit where (c=8 and course.cid=credit.cid);

select name,l,t,p,c from course,credit where (t!=0 and course.cid=credit.cid);

select course.cid,name,l,t,p,c from course,credit where (c=6 and not (l=3 and t=0 and p=0) and course.cid=credit.cid);

select student.cid,course.name,student.name,l,t,p,c from student,course,credit 
where (student.cid=course.cid and course.cid=credit.cid and student.name='Pasch Paul Ole');

select roll_number,student.name,student.cid,course.name,l,t,p,c from student,course,credit where 
(student.cid=course.cid and course.cid=credit.cid and l=3 and t=1 and p=0 and c=8 and course.cid like 'EE%' and credit_status='Credit');


-- Task 6
select cid,UPPER(name) from student where UPPER(name) LIKE '%ATUL%';

select ROLL_NUMBER,credit_status,LOWER(course.name) from student,course
where (student.cid=course.cid and LOWER(course.name) LIKE 'introduction to%');

SELECT COUNT(Distinct(roll_number)) from student where cid like 'EE 3%';

select cid,name from course where cid like "____2_M";

select UPPER(student.name),UPPER(student.cid),UPPER(course.name),UPPER(credit_status) from student,course
where (student.cid=course.cid and UPPER(student.name) LIKE 'A%TA' AND Credit_status='Credit');


-- With join

-- Task 5

select name,l,t,p,c from course join credit where (c=8 and course.cid=credit.cid);

select name,l,t,p,c from course join credit where (t!=0 and course.cid=credit.cid);

select course.cid,name,l,t,p,c from course join credit where (c=6 and not (l=3 and t=0 and p=0) and course.cid=credit.cid);

select student.cid,course.name,student.name,l,t,p,c from student,course,credit 
where (student.cid=course.cid and course.cid=credit.cid and student.name='Pasch Paul Ole');

select roll_number,student.name,student.cid,course.name,l,t,p,c from student,course,credit where 
(student.cid=course.cid and course.cid=credit.cid and l=3 and t=1 and p=0 and c=8 and course.cid like 'EE%' and credit_status='Credit');

