-- Active: 1675068196296@@127.0.0.1@3306
CREATE DATABASE week04;
use week04;
create table hss_table01 (
    sno int,
    roll_number int,
    sname char(50),
    cid char(10),
    cname char(60)
);

create table hss_table02 (
    sno int,
    roll_number int,
    sname char(50),
    cid char(10),
    cname char(60),
    PRIMARY KEY (cname)
);

-- Duplicate entry 'History of Contemporary India' for key 'hss_table02.PRIMARY' is output

create table hss_table03 (
    sno int,
    roll_number int,
    sname char(50),
    cid char(10),
    cname char(60),
    PRIMARY KEY (roll_number,cid)
);

-- AffectedRows : 1440

create table hss_table04 (
    sno int PRIMARY KEY,
    roll_number int PRIMARY KEY,
    sname char(50),
    cid char(10),
    cname char(60)
);

-- Multiple primary key defined

create table hss_course01 (
    cid char(10) PRIMARY KEY,
    cname char(60)
);

create table hss_table05 (
    sno int,
    roll_number int PRIMARY KEY,
    sname char(50),
    cid char(10),
    cname char(60),
    FOREIGN KEY (cid) REFERENCES hss_course01(cid)
);

-- Cannot add or update a child row: a foreign key constraint fails (`week04`.`hss_table05`, CONSTRAINT `hss_table05_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `hss_course01` (`cid`))

create table hss_course02 (
    cid char(10) ,
    cname char(60) PRIMARY KEY
);

create table hss_table06 (
    sno int,
    roll_number int,
    sname char(50),
    cid char(10),
    cname char(60),
    PRIMARY KEY (roll_number),
    FOREIGN KEY (cid) REFERENCES hss_course02(cid)
);

-- Failed to add the foreign key constraint. Missing index for constraint 'hss_table06_ibfk_1' in the referenced table 'hss_course02'

create table hss_course03 (
    cid char(10) ,
    cname char(60)
);

create table hss_table07 (
    sno int,
    roll_number int PRIMARY KEY,
    sname char(50),
    cid char(10),
    cname char(60),
    FOREIGN KEY (cid) REFERENCES hss_course03(cid)
);

-- Failed to add the foreign key constraint. Missing index for constraint 'hss_table07_ibfk_1' in the referenced table 'hss_course03'