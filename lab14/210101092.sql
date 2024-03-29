-- Active: 1675068196296@@127.0.0.1@3306@week14a


-- Task 1-----------------------------------------------------------------------------------------------

-- drop database week14a;
create database week14a;

-- Output
-- create database week14a
-- AffectedRows : 1

use week14a;

-- Task 2-----------------------------------------------------------------------------------------------

create table account(
    account_number char(5),
    balance int,
    original_balance int,
    primary key(account_number)
);

create table move_funds(
    from_acc char(5),
    to_acc char(5),
    transfer_amount int
);

create table move_funds_log(
    account_number char(5),
    move_fund_type char(10),
    amount int,
    timestamp DATETIME,
    Foreign Key (account_number) REFERENCES account(account_number),
    check(move_fund_type in ('deposit','withdraw') )
);
-- Output

-- create table account( account_number char(5), balance int, original_balance int, primary key(account_number) )

-- AffectedRows : 0

-- create table move_funds( from_acc char(5), to_acc char(5), transfer_amount int )

-- AffectedRows : 0

-- create table move_funds_log( account_number char(5), move_fund_type char(10), amount int, timestamp DATETIME, Foreign Key (account_number) REFERENCES account(account_number), check(move_fund_type in ('deposit','withdraw') ) )

-- AffectedRows : 0

-- Task 3-----------------------------------------------------------------------------------------------

-- delete from  `account`;
-- delete from move_funds_log;
-- delete from move_funds;
LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab14/account.csv' INTO
TABLE
    account FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab14/trnx.csv' INTO
TABLE
    move_funds FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Output

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab14/account.csv' INTO TABLE account FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS

-- AffectedRows : 8

-- LOAD DATA LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab14/trnx.csv' INTO TABLE move_funds FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS

-- AffectedRows : 200


-- Task 4-------------------------- Task 10 a-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------

create user saradhi IDENTIFIED by "Saradhi@1";
create user pbhaduri IDENTIFIED by "Pbhaduri@1";

select user from mysql.user;

-- Output

-- +------------------+
-- | user             |
-- +------------------+
-- | pbhaduri         |
-- | saradhi          |
-- | debian-sys-maint |
-- | mysql.infoschema |
-- | mysql.session    |
-- | mysql.sys        |
-- | root             |
-- +------------------+
-- 7 rows in set (0.00 sec)



-- Task 5 a-----------------------------------------------------------------------------------------------

grant select,insert,update,delete on account to saradhi;
grant select,insert,update,delete on move_funds to saradhi;
grant select,insert,update,delete on move_funds_log to saradhi;
grant select,insert,update,delete on account to pbhaduri;
grant select,insert,update,delete on move_funds to pbhaduri;
grant select,insert,update,delete on move_funds_log to pbhaduri;

-- Output

-- grant select,insert,update,delete on account to saradhi

-- AffectedRows : 0

-- grant select,insert,update,delete on move_funds to saradhi

-- AffectedRows : 0

-- grant select,insert,update,delete on move_funds_log to saradhi

-- AffectedRows : 0

-- grant select,insert,update,delete on account to pbhaduri

-- AffectedRows : 0

-- grant select,insert,update,delete on move_funds to pbhaduri

-- AffectedRows : 0

-- grant select,insert,update,delete on move_funds_log to pbhaduri

-- AffectedRows : 0

-- Task 5 b-----------------------------------------------------------------------------------------------

grant lock TABLES on week14a.* to saradhi,pbhaduri;

-- Output

-- grant lock TABLES on week14a.* to saradhi,pbhaduri

-- AffectedRows : 0

show grants for pbhaduri;

-- Output
-- +--------------------------------------------------------------------------------------+
-- | Grants for pbhaduri@%                                                                |
-- +--------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `pbhaduri`@`%`                                                 |
-- | GRANT LOCK TABLES ON `week14a`.* TO `pbhaduri`@`%`                                   |
-- | GRANT SELECT, INSERT, UPDATE, DELETE ON `week14a`.`account` TO `pbhaduri`@`%`        |
-- | GRANT SELECT, INSERT, UPDATE, DELETE ON `week14a`.`move_funds_log` TO `pbhaduri`@`%` |
-- | GRANT SELECT, INSERT, UPDATE, DELETE ON `week14a`.`move_funds` TO `pbhaduri`@`%`     |
-- | GRANT EXECUTE ON PROCEDURE `week14a`.`main_transfer_2` TO `pbhaduri`@`%`             |
-- | GRANT EXECUTE ON PROCEDURE `week14a`.`transfer_funds_1` TO `pbhaduri`@`%`            |
-- | GRANT EXECUTE ON PROCEDURE `week14a`.`transfer_funds_2` TO `pbhaduri`@`%`            |
-- +--------------------------------------------------------------------------------------+
-- 8 rows in set (0.00 sec)


-- Task 5 c,d,e-----------------------------------------------------------------------------------------------

GRANT EXECUTE on PROCEDURE transfer_funds_1 to saradhi,pbhaduri;
GRANT EXECUTE on PROCEDURE transfer_funds_2 to saradhi,pbhaduri;
GRANT EXECUTE on PROCEDURE main_transfer_2 to saradhi,pbhaduri;

-- Output

-- GRANT EXECUTE on PROCEDURE transfer_funds_1 to saradhi,pbhaduri

-- AffectedRows : 0

-- GRANT EXECUTE on PROCEDURE transfer_funds_2 to saradhi,pbhaduri

-- AffectedRows : 0

-- GRANT EXECUTE on PROCEDURE main_transfer_2 to saradhi,pbhaduri

-- AffectedRows : 0



-- Task 6 a-----------------------------------------------------------------------------------------------

-- drop PROCEDURE transfer_funds_1;
CREATE PROCEDURE transfer_funds_1 (
    IN from_acc char(5),
    IN to_acc char(5),
    IN transfer_amount int
)
BEGIN 
    START TRANSACTION;
    UPDATE account SET balance = balance - transfer_amount WHERE account_number  = from_acc;
    UPDATE account SET balance = balance + transfer_amount WHERE account_number  = to_acc;
    COMMIT;
END;

-- Output

-- CREATE PROCEDURE transfer_funds_1 ( IN from_acc char(5), IN to_acc char(5), IN transfer_amount int ) BEGIN START TRANSACTION; UPDATE account SET balance = balance - transfer_amount WHERE account_number = from_acc; UPDATE account SET balance = balance + transfer_amount WHERE account_number = to_acc; COMMIT; END;

-- AffectedRows : 0

-- Task 6 b-----------------------------------------------------------------------------------------------

lock tables account write;
lock table move_funds read;


set @from2= (select from_acc from move_funds limit 1);
set @to2= (select to_acc from move_funds limit 1);
set @amt2= (select transfer_amount from move_funds limit 1);

call transfer_funds_1(@from2,@to2,@amt2);

unlock tables;

-- Output : The table is changed as the user which locks has write priviledges

-- Output

-- +----------------+---------+------------------+
-- | account_number | balance | original_balance |
-- +----------------+---------+------------------+
-- | 06428          |    7074 |             7074 |
-- | 15873          |   10455 |            10205 |
-- | 23904          |    5500 |             5500 |
-- | 28686          |    5924 |             5924 |
-- | 36454          |    7311 |             7311 |
-- | 52149          |    9240 |             9490 |
-- | 62151          |   11037 |            11037 |
-- | 86792          |    6320 |             6320 |
-- +----------------+---------+------------------+
-- 8 rows in set (0.01 sec)


-- Task 6 c-----------------------------------------------------------------------------------------------

lock tables account write;
lock table move_funds read;

set @from2= (select from_acc from move_funds limit 1);
set @to2= (select to_acc from move_funds limit 1);
set @amt2= (select transfer_amount from move_funds limit 1);

call transfer_funds_1(@from2,@to2,@amt2);

unlock tables;

-- Output : The table is changed as the user which locks has write priviledges

-- Output
-- +----------------+---------+------------------+
-- | account_number | balance | original_balance |
-- +----------------+---------+------------------+
-- | 06428          |    7074 |             7074 |
-- | 15873          |   10705 |            10205 |
-- | 23904          |    5500 |             5500 |
-- | 28686          |    5924 |             5924 |
-- | 36454          |    7311 |             7311 |
-- | 52149          |    8990 |             9490 |
-- | 62151          |   11037 |            11037 |
-- | 86792          |    6320 |             6320 |
-- +----------------+---------+------------------+
-- 8 rows in set (0.00 sec)



-- Task 7-----------------------------------------------------------------------------------------------
-- drop PROCEDURE transfer_funds_2;
CREATE PROCEDURE transfer_funds_2 (
    IN from_acc CHAR(5),
    IN to_acc CHAR(5),
    IN transfer_amount INT
)
BEGIN
    DECLARE from_balance INT;
    DECLARE to_balance INT;
    DECLARE time1 DATETIME;
    START TRANSACTION;
    
    SELECT balance INTO from_balance FROM account WHERE account_number = from_acc;
    
    IF from_balance < 100 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance in account';
    END IF;
    
    UPDATE account SET balance = balance - transfer_amount WHERE account_number = from_acc;
    UPDATE account SET balance = balance + transfer_amount WHERE account_number = to_acc;
    select now() into time1;

    INSERT INTO move_funds_log VALUES(from_acc, "withdraw",transfer_amount,time1);
	INSERT INTO move_funds_log VALUES(to_acc, "deposit",transfer_amount,time1);
    
    COMMIT;
END;

-- Output

-- CREATE PROCEDURE transfer_funds_2 ( IN from_acc CHAR(5), IN to_acc CHAR(5), IN transfer_amount INT ) BEGIN DECLARE from_balance INT; DECLARE to_balance INT; DECLARE time1 DATETIME; START TRANSACTION; SELECT balance INTO from_balance FROM account WHERE account_number = from_acc; IF from_balance < 100 THEN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance in account'; END IF; UPDATE account SET balance = balance - transfer_amount WHERE account_number = from_acc; UPDATE account SET balance = balance + transfer_amount WHERE account_number = to_acc; select now() into time1; INSERT INTO move_funds_log VALUES(from_acc, "withdraw",transfer_amount,time1); INSERT INTO move_funds_log VALUES(to_acc, "deposit",transfer_amount,time1); COMMIT; END;

-- AffectedRows : 0

-- Task 8-----------------------------------------------------------------------------------------------


-- drop PROCEDURE main_transfer_2;
CREATE PROCEDURE main_transfer_2()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE from2 char(5);
    DECLARE to2 char(5);
    DECLARE amt2 int;
    DECLARE cur CURSOR FOR 
    SELECT from_acc, to_acc, transfer_amount 
    FROM move_funds;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO from2, to2, amt2;

        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL transfer_funds_2(from2, to2, amt2);
    END LOOP;

    CLOSE cur;
END;

-- Output

-- CREATE PROCEDURE main_transfer_2() BEGIN DECLARE done INT DEFAULT FALSE; DECLARE from2 char(5); DECLARE to2 char(5); DECLARE amt2 int; DECLARE cur CURSOR FOR SELECT from_acc, to_acc, transfer_amount FROM move_funds; DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; OPEN cur; read_loop: LOOP FETCH cur INTO from2, to2, amt2; IF done THEN LEAVE read_loop; END IF; CALL transfer_funds_2(from2, to2, amt2); END LOOP; CLOSE cur; END;

-- AffectedRows : 0

-- Task 9-----------------------------------------------------------------------------------------------

call main_transfer_2();

-- Output

-- call main_transfer_2()

-- Number of rows in move_funds_log =800 (if done sequentially else 400 if done parallely)


-- Task 10 a-----------------------------------------------------------------------------------------------

select account_number, sum(amount) as "total_withdraw" from move_funds_log where move_fund_type='withdraw' group by account_number;


-- Output 
-- +----------------+----------------+
-- | account_number | total_withdraw |
-- +----------------+----------------+
-- | 06428          |          12884 |
-- | 15873          |          19598 |
-- | 23904          |          18664 |
-- | 28686          |          22322 |
-- | 36454          |          16448 |
-- | 52149          |          24848 |
-- | 62151          |           6594 |
-- +----------------+----------------+
-- 7 rows in set (0.01 sec)


-- Task 10 b-----------------------------------------------------------------------------------------------


select account_number, sum(amount) as "total_deposit" from move_funds_log where move_fund_type='deposit' group by account_number;

-- Output
-- +----------------+---------------+
-- | account_number | total_deposit |
-- +----------------+---------------+
-- | 06428          |          9826 |
-- | 15873          |         13646 |
-- | 23904          |         20492 |
-- | 28686          |         19934 |
-- | 36454          |         17890 |
-- | 52149          |         24820 |
-- | 62151          |         14750 |
-- +----------------+---------------+
-- 7 rows in set (0.01 sec)


-- Task 10 c-----------------------------------------------------------------------------------------------

-- drop view v1;
-- drop view v2;

create view v1 as select account_number, sum(amount) as "total_withdraw" from move_funds_log where move_fund_type='withdraw' group by account_number;
 
 create view v2 as select account_number, sum(amount) as "total_deposit" from move_funds_log where move_fund_type='deposit' group by account_number;;


select account_number,original_balance+total_deposit-total_withdraw,balance  from `account`  NATURAL join v1  NATURAL join v2;

-- Output : (If no rollback in question 6, here 2 rows won't have LHS and RHS same)

-- +----------------+-----------------------------------------------+---------+
-- | account_number | original_balance+total_deposit-total_withdraw | balance |
-- +----------------+-----------------------------------------------+---------+
-- | 06428          |                                          4016 |    4016 |
-- | 15873          |                                          4253 |    4753 |
-- | 23904          |                                          7328 |    7328 |
-- | 28686          |                                          3536 |    3536 |
-- | 36454          |                                          8753 |    8753 |
-- | 52149          |                                          9462 |    8962 |
-- | 62151          |                                         19193 |   19193 |
-- +----------------+-----------------------------------------------+---------+
-- 7 rows in set (0.00 sec)

-- Output (If rollback in question 6)

-- +----------------+-----------------------------------------------+---------+
-- | account_number | original_balance+total_deposit-total_withdraw | balance |
-- +----------------+-----------------------------------------------+---------+
-- | 06428          |                                          4016 |    4016 |
-- | 15873          |                                          4253 |    4253 |
-- | 23904          |                                          7328 |    7328 |
-- | 28686          |                                          3536 |    3536 |
-- | 36454          |                                          8753 |    8753 |
-- | 52149          |                                          9462 |    9462 |
-- | 62151          |                                         19193 |   19193 |
-- +----------------+-----------------------------------------------+---------+
-- 7 rows in set (0.01 sec)


