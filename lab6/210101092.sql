-- Active: 1675068196296@@127.0.0.1@3306@week06
create database week06;

use week06;


create table student (
    cid char(7),
    roll_number char(10),
    name char(100) NOT NULL,
    approval_status ENUM('Approved','Pending'),
    credit_status ENUM('Credit','Audit'),
    primary key(roll_number,cid)
);


create table course(
    cid char(7),
    name char(100) NOT NULL,
    primary key(cid)
);

create table credit (
    cid char(7),
    l int NOT NULL,
    t int NOT NULL,
    p int NOT NULL,
    c float NOT NULL,
    primary key(cid)
);

create table faculty (
    cid char(7),
    name char(50)
);

create table semester (
    dept char(4),
    number char(4),
    cid char(7)
);

-- Question 3

-- 3a
LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab6/students-credits.csv' INTO TABLE student
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 3b
LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab6/courses.csv' INTO TABLE course
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 3c
LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab6/credits.csv' INTO TABLE credit
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 3d
LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab6/faculty-course.csv' INTO TABLE faculty
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 3e
LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab6/semester.csv' INTO TABLE semester
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


-- Question 4

-- 4a
select SUM(l) as"Total No of Lectures" from credit;

-- 4b
select SUM(c) as"Total No of Credits" from credit where cid like 'EE%';

-- 4c
select SUM(p) as"Total No of Practicals" from credit where cid like 'DD%';

-- Question 5

-- 5a
select cid as "ID",count(roll_number)as "No of Students" from student 
where (cid like'%M' and credit_status="Audit") group by cid;

-- 5b

select LEFT(cid,2) as "Course",sum(c)as "Credits" from credit group by LEFT(cid,2);

-- Question 6

-- 6a
select cid as "ID",count(roll_number)as "No of Students" from student 
where credit_status="Audit" group by cid having count(roll_number)>3;

-- 6b
select faculty.cid as "ID",course.name as "Course Name", count(faculty.name) as "No of faculty" 
from course join faculty where (faculty.cid=course.cid) 
group by faculty.cid having count(faculty.name)>1;

-- 6c
select faculty.name as "Faculty Name", count(course.cid) as "No of Courses" 
from course join faculty where (faculty.cid=course.cid) 
group by faculty.name having count(course.cid)>1;

-- Question 7

-- 7a
select course.cid as "ID",course.name as "Name" 
from credit natural join course 
where (credit.cid=course.cid and credit.c <=all(select c from credit)) ;

-- 7b
select faculty.cid as "ID",faculty.name as "Name"
from credit natural join faculty 
where (credit.cid=faculty.cid and credit.c <=all(
    select c from credit where cid like "CS%")
     and faculty.cid like "CS%") ;


-- Question 8

-- 8a
select number as "Semester" from semester
 join credit where (credit.cid=semester.cid and semester.dept='BSBE')
  group by number having (sum(c)<
  any(select sum(c) from semester join credit where (credit.cid=semester.cid and semester.dept='DD') 
  group by number));

-- 8b
select number as "Semester" from semester
 join credit where (credit.cid=semester.cid and semester.dept='BSBE')
  group by number having (sum(c)>=all(
    select sum(c) from semester join credit where (credit.cid=semester.cid and semester.dept='DD') 
    group by number));
