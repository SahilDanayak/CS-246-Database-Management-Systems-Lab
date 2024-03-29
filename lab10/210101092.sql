-- Active: 1675068196296@@127.0.0.1@3306@week10

-- drop database week10;
create database week10;

use week10;

-- Task 2

create table
    student18(
        name char(100),
        roll_number char(10),
        cpi float default 0.0,
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
        primary key(roll_number, cid)
    );

create table
    curriculum(
        dept char(4),
        number int,
        cid char(7)
    );

create table grade_point( letter_grade char(2), value int );

create table
    trigger_log(
        my_action char(10) check (
            my_action in ('INSERT', 'UPDATE', 'DELETE')
        ),
        roll_number char(10),
        semester int,
        SPI DECIMAL(4, 2),
        CPI DECIMAL(4, 2) -- Foreign Key (semester) REFERENCES course18(semester)
    );

CREATE TABLE
    transcript (
        roll_number char(10),
        semester int,
        SPI decimal(4, 2),
        CPI decimal(4, 2)
    );

create table
    u_grade18 (
        roll_number char(10),
        cid char(7),
        letter_grade char(2),
        primary key(roll_number, cid)
    );



-- Task 3

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/student18.csv' INTO
TABLE
    student18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/course18.csv' INTO
TABLE
    course18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/curriculum.csv' INTO
TABLE
    curriculum FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/u_grade18.csv' INTO
TABLE
    u_grade18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/grade_point.csv' INTO
TABLE
    grade_point FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/transcript.csv' INTO
TABLE
    transcript FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Task 4 Part a i




CREATE TRIGGER INCORRECT_GRADE BEFORE INSERT ON grade18 
FOR EACH ROW BEGIN 
	IF NEW.LETTER_GRADE not in (
	    select letter_grade
	    from
	        grade_point
	) THEN SIGNAL SQLSTATE '50001'
	SET
	    MESSAGE_TEXT = 'GRADE IS INVALID';
	END IF;
END; 

-- insert into grade18 values ('3434','343','sw');

-- insert into grade18 values ('3434','343','aa');

-- Task 4 Part a ii.i


create trigger TRANSCRIPT_CHANGE_INSERT after insert on grade18

for each row

begin

    update transcript

    set SPI = (select sum(c*value)/sum(c)

                        from grade18 natural join course18 natural join grade_point

                        where roll_number=new.roll_number and semester=transcript.semester and c!=0)

    where transcript.roll_number = new.roll_number and transcript.semester in (1,2,3,4,5,6,7,8);

    

    update transcript

    set CPI = (select sum(c*value)/sum(c)

                        from grade18 natural join course18 natural join grade_point

                        where roll_number=new.roll_number and semester <= transcript.semester and c!=0)

    where transcript.roll_number = new.roll_number and transcript.semester in (1,2,3,4,5,6,7,8);

end;

-- ALTERNATIVE CODE WITH INSERT AND DELETE STATEMENT FOR TRIGGER


-- CREATE TRIGGER TRANSCRIPT_CHANGE AFTER INSERT ON grade18 
-- FOR EACH ROW BEGIN 
-- 	delete from transcript where roll_number=NEW.roll_number;
-- 	insert into
-- 	    transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        1, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 1
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 1
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        2, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 2
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 2
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        3, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 3
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 3
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        4, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 4
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 4
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        5, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 5
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 5
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        6, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 6
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 6
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        7, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 7
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 7
-- 	                )
-- 	        )
-- 	    );
-- 	insert into transcript
-- 	values (
-- 	        NEW.roll_number,
-- 	        8, (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester = 8
-- 	                )
-- 	        ), (
-- 	            select
-- 	                sum(c * value) / sum(c)
-- 	            from grade18
-- 	                natural join course18
-- 	                natural join grade_point
-- 	            where (
-- 	                    roll_number = NEW.roll_number
-- 	                    and semester <= 8
-- 	                )
-- 	        )
-- 	    );
-- END; 


-- Task 4 Part a ii.ii

CREATE TRIGGER INSERT_TRIGGER_LOG AFTER INSERT ON grade18 
FOR EACH ROW BEGIN 
	insert into trigger_log
	values (
	        'INSERT',
	        NEW.roll_number, (
	            select semester
	            from grade18
	                natural join course18
	            where (
	                    roll_number = NEW.roll_number
	                    and cid = NEW.cid
	                )
	        ), (
	            select
	                sum(c * value) / sum(c)
	            from grade18
	                natural join course18
	                natural join grade_point
	            where (
	                    roll_number = NEW.roll_number and c!=0
	                    and semester = (
	                        select semester
	                        from grade18
	                            natural join course18
	                        where (
	                                roll_number = NEW.roll_number
	                                and cid = NEW.cid
	                            )
	                    )
	                )
	        ), (
	            select
	                sum(c * value) / sum(c)
	            from grade18
	                natural join course18
	                natural join grade_point
	            where (
	                    roll_number = NEW.roll_number and c!=0
	                    and semester <= (
	                        select semester
	                        from grade18
	                            natural join course18
	                        where (
	                                roll_number = NEW.roll_number
	                                and cid = NEW.cid
	                            )
	                    )
	                )
	        )
	    );
END; 

-- Task 4 b i

CREATE TRIGGER INCORRECT_GRADE_UPDATE BEFORE UPDATE ON grade18 
FOR EACH ROW BEGIN 
	IF NEW.LETTER_GRADE not in (
	    select letter_grade
	    from
	        grade_point
	) THEN SIGNAL SQLSTATE '50001'
	SET
	    MESSAGE_TEXT = 'GRADE IS INVALID';
	END IF;
END; 

-- Task 4 b ii.i

create trigger TRANSCRIPT_CHANGE_UPDATE after update on grade18

for each row

begin

    update transcript

    set SPI = (select sum(c*value)/sum(c)

                        from grade18 natural join course18 natural join grade_point

                        where roll_number=new.roll_number and semester=transcript.semester  AND c!=0)

    where transcript.roll_number = new.roll_number and transcript.semester in (1,2,3,4,5,6,7,8);

    

    update transcript

    set CPI = (select sum(c*value)/sum(c)

                        from grade18 natural join course18 natural join grade_point

                        where roll_number=new.roll_number and semester <= transcript.semester  AND c!=0)

    where transcript.roll_number = new.roll_number and transcript.semester in (1,2,3,4,5,6,7,8);

end;

-- Task 4 b ii.ii
CREATE TRIGGER UPDATE_TRIGGER_LOG AFTER update ON grade18 
FOR EACH ROW BEGIN 
	insert into trigger_log
	values (
	        'UPDATE',
	        NEW.roll_number, (
	            select semester
	            from grade18
	                natural join course18
	            where (
	                    roll_number = NEW.roll_number
	                    and cid = NEW.cid
	                )
	        ), (
	            select
	                sum(c * value) / sum(c)
	            from grade18
	                natural join course18
	                natural join grade_point
	            where (
	                    roll_number = NEW.roll_number AND c!=0
	                    and semester = (
	                        select semester
	                        from grade18
	                            natural join course18
	                        where (
	                                roll_number = NEW.roll_number
	                                and cid = NEW.cid
	                            )
	                    )
	                )
	        ), (
	            select
	                sum(c * value) / sum(c)
	            from grade18
	                natural join course18
	                natural join grade_point
	            where (
	                    roll_number = NEW.roll_number AND c!=0
	                    and semester <= (
	                        select semester
	                        from grade18
	                            natural join course18
	                        where (
	                                roll_number = NEW.roll_number
	                                and cid = NEW.cid
	                            )
	                    )
	                )
	        )
	    );
END; 



-- Task 4 c i.i


create trigger TRANSCRIPT_CHANGE_DELETE after delete on grade18

for each row

begin

    update transcript

    set SPI = (select sum(c*value)/sum(c)

                        from grade18 natural join course18 natural join grade_point

                        where roll_number=old.roll_number and semester=transcript.semester  AND c!=0)

    where transcript.roll_number = old.roll_number and transcript.semester in (1,2,3,4,5,6,7,8);

    

    update transcript

    set CPI = (select sum(c*value)/sum(c)

                        from grade18 natural join course18 natural join grade_point

                        where roll_number=old.roll_number and semester <= transcript.semester  AND c!=0)

    where transcript.roll_number = old.roll_number and transcript.semester in (1,2,3,4,5,6,7,8);

end;

-- Task 4 c i.ii

CREATE TRIGGER DELETE_TRIGGER_LOG AFTER DELETE ON grade18 
FOR EACH ROW BEGIN 
	insert into trigger_log
	values (
	        'DELETE',
	        OLD.roll_number, (
	            select semester
	            from grade18
	                natural join course18
	            where (
	                    roll_number = OLD.roll_number
	                    and cid = OLD.cid
	                )
	        ), (
	            select
	                sum(c * value) / sum(c)
	            from grade18
	                natural join course18
	                natural join grade_point
	            where (
	                    roll_number = OLD.roll_number  AND c!=0
	                    and semester = (
	                        select semester
	                        from grade18
	                            natural join course18
	                        where (
	                                roll_number = OLD.roll_number
	                                and cid = OLD.cid
	                            )
	                    )
	                )
	        ), (
	            select
	                sum(c * value) / sum(c)
	            from grade18
	                natural join course18
	                natural join grade_point
	            where (
	                    roll_number = OLD.roll_number  AND c!=0
	                    and semester <= (
	                        select semester
	                        from grade18
	                            natural join course18
	                        where (
	                                roll_number = OLD.roll_number
	                                and cid = OLD.cid
	                            )
	                    )
	                )
	        )
	    );
END; 


-- Task 5

LOAD DATA
    LOCAL INFILE '/home/sahil/Documents/VS codes/dbms lab/lab10/grade18.csv' INTO
TABLE
    grade18 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

-- Task 6

update grade18
SET letter_grade = (SELECT letter_grade 
                    FROM u_grade18 
                    WHERE u_grade18.roll_number = grade18.roll_number and u_grade18.cid = grade18.cid)
WHERE EXISTS (SELECT * 
            FROM u_grade18 
            WHERE u_grade18.roll_number = grade18.roll_number and u_grade18.cid = grade18.cid);

-- Task 7

delete from grade18;


select * from trigger_log;