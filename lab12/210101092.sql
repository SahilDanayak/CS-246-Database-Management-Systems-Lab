-- Active: 1675068196296@@127.0.0.1@3306@week12


-- Task 1
-- drop database week12;
create database week12;

use week12;

-- Task 2

create table student(
    name char(50),
    IQ int,
    gender char(1),
    primary key(name)
);

create table speak(
    name char(50),
    language char(50),
    primary key(name,language)
);

-- Output

-- create table student( name char(50), IQ int, gender char(1), primary key(name) )

-- AffectedRows : 0

-- create table speak( name char(50), language char(50), primary key(name,language) )

-- AffectedRows : 0


-- Task 3

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab12/student.csv' INTO
TABLE
    student FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab12/speaks.csv' INTO
TABLE
    speak FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' ;

-- Output

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab12/student.csv' INTO TABLE student FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
-- AffectedRows : 6
-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab12/speaks.csv' INTO TABLE speak FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
-- AffectedRows : 15


-- Task 4 a
with numb(lang,cnt) as (
    select language,count(*) from speak group by language
    ) 
select lang from numb where (cnt = (select min(cnt) from numb));

-- Task 4 b
with t2(lang,rnk) as (
    with numb(lang,cnt) as (
        select language,count(*) from speak group by language
        )
    select lang, rank() over (order by (cnt)) as s_rank
from numb) 
select lang from t2 where rnk=1;

-- Task 5 a

with numb(name,cnt) as (
    select name,count(*) from speak group by name
    ) 
select name from numb where (cnt = (select max(cnt) from numb));

-- Task 5 b

with t2(name,rnk) as ( 
    with numb(name,cnt) as (
        select name,count(*) from speak group by name
        )
     select name, rank() over (order by (cnt) desc) as s_rank
from numb) 
select name from t2 where rnk=1;

-- Task 6 a

with t3(gender,iq) as (
    select gender, avg(iq) from student group by gender
    ) 
select gender from t3 where (iq=(select max(iq) from t3));

-- Task 6 b

-- With rank
with t4(gender,rnk) as (
     with t3(gender,iq) as (
        select gender,avg(iq) from student group by gender
        ) 
    select gender, rank() over (order by (iq) desc) as s_rank
from t3
) select gender from t4 where rnk=1;

-- With denserank
with t4(gender,rnk) as ( 
    with t3(gender,iq) as (
        select gender,avg(iq) from student group by gender
        ) 
    select gender, dense_rank() over (order by (iq) desc) as s_rank
from t3)
select gender from t4 where rnk=1;

-- Task 7
select name,iq from student natural join speak where language="Japanese" order by iq desc limit 2;

-- Task 8

with t5(iq) as (
    select max(iq) from student group by gender
    ) 
select name,gender from student where iq in (select iq from t5);