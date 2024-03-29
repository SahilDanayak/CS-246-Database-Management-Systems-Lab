-- Active: 1675068196296@@127.0.0.1@3306@week09
create database week09;

-- Task 1

use week09;

drop database week09;

-- Task 2

-- Creating the tables

create table
    student18(
        name char(100),
        roll_number char(10),
        primary key(roll_number)
    );

create table
    course18 (
        semester int,
        cid char(7),
        name char(100),
        l int,
        p int,
        t int,
        c int,
        primary key(cid)
    );

create table
    grade18 (
        roll_number char(10),
        cid char(7),
        letter_grade char(2),
        primary key(roll_number,cid)
    );

create table
    curriculum(
        dept char(3),
        number int,
        cid char(7)
    );


-- Task 3 : Loading the data into files using load command

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab9/student18.csv' INTO
TABLE
    student18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab9/grade18.csv' INTO
TABLE
    grade18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab9/course18.csv' INTO
TABLE
    course18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab9/curriculum.csv' INTO
TABLE
    curriculum FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';


-- Task 4d

drop table conversion;

create table conversion(letter_grade char(2),cr int);
insert into conversion values('AA',10);
insert into conversion values('AB',9);
insert into conversion values('BB',8);
insert into conversion values('BC',7);
insert into conversion values('CC',6);
insert into conversion values('CD',5);
insert into conversion values('DD',4);
insert into conversion values('FA',0);
insert into conversion values('FP',0);
insert into conversion values('NP',0);
insert into conversion values('PP',0);
insert into conversion values('I',0);
insert into conversion values('X',0);