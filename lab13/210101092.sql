-- Active: 1675068196296@@127.0.0.1@3306@week13


-- Task 1-----------------------------------------------------------------------------------------------

-- drop database week13;
create database week13;

use week13;

-- Task 2-----------------------------------------------------------------------------------------------

create table location(
    location_id int,
    city char(10),
    state char(2),
    country char(20),
    primary key(location_id)
);

create table product(
    product_id int,
    product_name char(10),
    category char(2),
    price int,
    primary key(product_id)
);

create table sale(
    product_id int,
    time_id int,
    location_id int,
    sales int,
    primary key(product_id,time_id,location_id)
);
-- Output

-- create table location( location_id int, city char(10), state char(2), country char(20), primary key(location_id) )

-- AffectedRows : 0

-- create table product( product_id int, product_name char(10), category char(2), price int, primary key(product_id) )

-- AffectedRows : 0

-- create table sale( product_id int, time_id int, location_id int, sales int, primary key(product_id,time_id,location_id) )

-- AffectedRows : 0

-- Task 3-----------------------------------------------------------------------------------------------

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab13/location.csv' INTO
TABLE
    location FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab13/product.csv' INTO
TABLE
    product FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab13/sale.csv' INTO
TABLE
    sale FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Output

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab13/location.csv' INTO TABLE location FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS

-- AffectedRows : 3

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab13/product.csv' INTO TABLE product FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS

-- AffectedRows : 3

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab13/sale.csv' INTO TABLE sale FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS

-- AffectedRows : 18


-- Task 4 a-----------------------------------------------------------------------------------------------

-- drop TABLE year_state_01;
create table year_state_01 (
    year char(10),
    WI int,
    CA int,
    Total int
);

INSERT INTO year_state_01 values ('1995',NULL,NULL,NULL),('1996',NULL,NULL,NULL),('1997',NULL,NULL,NULL);
INSERT INTO year_state_01 values ('Total',NULL,NULL,NULL);


-- Task 4 a i

update year_state_01 set `CA`= (select sum(sales) from sale natural join location where time_id='1995' and state='CA' ) where year='1995';

-- Task 4 a ii

update year_state_01 set `WI`= (select sum(sales) from sale natural join location where time_id='1995' and state='WI' ) where year='1995';

-- Task 4 a iii

update year_state_01 set `Total`= (select sum(sales) from sale natural join location where state in ('WI','CA') and time_id='1995') where year='1995';

-- Task 4 a iv

update year_state_01 set `CA`= (select sum(sales) from sale natural join location where time_id='1996' and state='CA' ) where year='1996';

-- Task 4 a v

update year_state_01 set `WI`= (select sum(sales) from sale natural join location where time_id='1996' and state='WI' ) where year='1996';

-- Task 4 a vi

update year_state_01 set `Total`= (select sum(sales) from sale natural join location where state in ('WI','CA') and time_id='1996') where year='1996';

-- Task 4 a vii

update year_state_01 set `CA`= (select sum(sales) from sale natural join location where time_id='1997' and state='CA' ) where year='1997';

-- Task 4 a viii

update year_state_01 set `WI`= (select sum(sales) from sale natural join location where time_id='1997' and state='WI' ) where year='1997';

-- Task 4 a ix

update year_state_01 set `Total`= (select sum(sales) from sale natural join location where state in ('WI','CA') and time_id='1997') where year='1997';

-- Task 4 a x

update year_state_01 set `CA`= (select sum(sales) from sale natural join location where state='CA' ) where year='Total';

-- Task 4 a xi

update year_state_01 set `WI`= (select sum(sales) from sale natural join location where state='WI' ) where year='Total';

-- Task 4 a xii

update year_state_01 set `Total`= (select sum(sales) from sale natural join location where state in ('WI','CA') ) where year='Total';

select * from year_state_01;

-- Output

-- +-------+------+------+-------+
-- | year  | WI   | CA   | Total |
-- +-------+------+------+-------+
-- | 1995  |   63 |   81 |   144 |
-- | 1996  |   38 |  107 |   145 |
-- | 1997  |   75 |   35 |   110 |
-- | Total |  176 |  223 |   399 |
-- +-------+------+------+-------+


-- OPTIONAL METHOD

-- insert into
--     year_state_01 
-- select 
--     '1995',wi.c1,ca.c2,tot.c3 
-- from 
--     (select sum(sales) as c1 from sale where time_id='1995' and location_id=1) AS wi
-- CROSS JOIN
--     (select sum(sales) as c2 from sale where time_id='1995' and location_id=2) as ca
-- CROSS JOIN
--     (select sum(sales) as c3 from sale where time_id='1995') as tot;





-- Task 4 B i-----------------------------------------------------------------------------------------------

create table year_state_02_01 as
select time_id as Time,sum(CASE WHEN state='WI' THEN sales END) WI,sum(CASE WHEN state='CA' THEN sales END) CA
from sale natural join location 
group by time_id
order by time;

-- Task 4 B ii-----------------------------------------------------------------------------------------------
create table year_state_02_02 as
select sum(WI+CA) as "Total"
from year_state_02_01
group by time;



-- Task 4 B iii-----------------------------------------------------------------------------------------------

create table year_state_02_03 as
select "Total",sum(WI) as "WI",sum(CA) as "CA"
from year_state_02_01
;


-- Task 4 B iv-----------------------------------------------------------------------------------------------


create table year_state_02_04 as
select sum(Total) as "Total"
from year_state_02_02;
;

select * from year_state_02_01;

-- Output

-- +------+------+------+
-- | Time | WI   | CA   |
-- +------+------+------+
-- | 1995 |   63 |   81 |
-- | 1996 |   38 |  107 |
-- | 1997 |   75 |   35 |
-- +------+------+------+

select * from year_state_02_02;

-- Output

-- +-------+
-- | Total |
-- +-------+
-- |   144 |
-- |   145 |
-- |   110 |
-- +-------+



select * from year_state_02_03;

-- Output

-- +-------+------+------+
-- | Total | WI   | CA   |
-- +-------+------+------+
-- | Total |  176 |  223 |
-- +-------+------+------+



select * from year_state_02_04;

-- Output

-- +-------+
-- | Total |
-- +-------+
-- |   399 |
-- +-------+


-- Task 4 C-----------------------------------------------------------------------------------------------

CREATE TABLE year_state_03 AS(
SELECT
time_id as Year,
SUM(CASE
  WHEN state = 'WI' THEN sales ELSE 0 END
) AS WI,
SUM(CASE
  WHEN state = 'CA' THEN sales ELSE 0 END
) AS CA,
SUM(sales) AS Total
FROM sale NATURAL JOIN location
GROUP BY time_id
UNION
SELECT "Total",
SUM(CASE
  WHEN state = 'WI' THEN sales ELSE 0 END
) AS WI,
SUM(CASE
  WHEN state = 'CA' THEN sales ELSE 0 END
) AS CA,
SUM(CASE
  WHEN state in ('CA','WI') THEN sales ELSE 0 END
) AS Total
FROM sale NATURAL JOIN location
);

select * from year_state_03;

-- Output

-- +-------+------+------+-------+
-- | Year  | WI   | CA   | Total |
-- +-------+------+------+-------+
-- | 1995  |   63 |   81 |   144 |
-- | 1996  |   38 |  107 |   145 |
-- | 1997  |   75 |   35 |   110 |
-- | Total |  176 |  223 |   399 |
-- +-------+------+------+-------+


-- Task 4 d-----------------------------------------------------------------------------------------------

CREATE TABLE year_state_04
AS(
SELECT
IF(GROUPING(time_id), 'Total', time_id) AS Year,
SUM(CASE
  WHEN state = 'WI' THEN sales ELSE 0 END
) AS WI,
SUM(CASE
  WHEN state = 'CA' THEN sales ELSE 0 END
) AS CA,
SUM(CASE
  WHEN state in ('CA','WI') THEN sales ELSE 0 END
) AS Total
FROM location natural join sale
GROUP BY time_id with rollup);

select * from year_state_04;

-- Output
-- +-------+------+------+-------+
-- | Year  | WI   | CA   | Total |
-- +-------+------+------+-------+
-- | 1995  |   63 |   81 |   144 |
-- | 1996  |   38 |  107 |   145 |
-- | 1997  |   75 |   35 |   110 |
-- | Total |  176 |  223 |   399 |
-- +-------+------+------+-------+

