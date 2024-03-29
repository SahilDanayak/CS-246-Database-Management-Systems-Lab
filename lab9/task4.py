# Task 4
import sys
import mysql.connector 
from mysql.connector import errorcode

try:
  mycon = mysql.connector.connect(host='localhost',user='root',passwd='smdpmd00')
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)



cursor=mycon.cursor()
cursor.execute('use week09;')
rollno=sys.argv[1]
# print("Rollno:",rollno)
# print(sys.argv)

#Task 4a
print("Indian Institutte of Technology Guwahati\n")


# Task 4b
print("Programme Duration: 4 years                      Semesters:Eight(8)\n")
cursor.execute('select name from student18 where roll_number={};'.format(rollno))
print("Name:  {name}                      Roll Number: {rollno}\n".format(name=cursor.fetchone()[0],rollno=rollno))

# Task 4c

print("Semester     Course          CourseName                                                                                           Cr")
cursor.execute('select semester,cid,name,letter_grade from grade18 natural join course18 where roll_number={} order by semester,cid;'.format(rollno))
grades=cursor.fetchall()
sem=1
for grade in grades:
    if (sem!=grade[0]): print("\n")
    print("{:5d}\t     {:10s}      {:100s} {}".format(grade[0],grade[1],grade[2],grade[3]))
    sem=grade[0]

# Task 4d

#Created a table conversion in mysql to convert grades to values

cursor.execute('select semester,round(sum(cr*c)/sum(c),2) from grade18 natural join conversion natural join course18 where roll_number={} group by semester order by semester;'.format(rollno))
spi_lst=cursor.fetchall()
for (sem,spi) in spi_lst:
    print("Semester: {}  SPI: {}".format(sem,spi))


# Task 4e

cursor.execute("select round(sum(cr*c)/sum(c),2) from grade18 natural join conversion natural join course18 where roll_number= {} group by roll_number;".format(rollno))
print("CPI:",cursor.fetchone()[0])

# Task 4f

print("\n\n")
# cursor.execute("""
# select cid from curriculum
# where number = 1 and cid not like 'HS101'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 1;
# """.format(rollno))

# print("Semester 1: ",end=" ")
# for x in  cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 2 and cid not like 'SA1__'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 2;
# """.format(rollno))

# print("\nSemester 2: ",end=" ")
# for x in  cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 3 and cid not like 'SA1__' AND cid not like 'HS200'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 3;
# """.format(rollno))

# print("\nSemester 3: ",end=" ")
# for x in cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 4 and cid not like 'HS1_' AND cid not like 'SA3_' AND cid not like '%M'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 4;
# """.format(rollno))

# print("\nSemester 4: ",end=" ")
# for x in cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 5 and cid not like 'SA4__' AND cid not like '%M'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 5;
# """.format(rollno))

# print("\nSemester 5: ",end=" ")
# for x in cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 6 and cid not like '%M'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 6;
# """.format(rollno))

# print("\nSemester 6: ",end=" ")
# for x in cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 7 and cid like 'CS498'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 7;
# """.format(rollno))

# print("\nSemester 7: ",end=" ")
# for x in cursor:
#   print(x[0],end=',')

# cursor.execute("""
# select cid from curriculum
# where number = 8 and cid like 'CS499'
# EXCEPT
# select cid
# from grade18 natural join course18
# where roll_number = {} and semester = 8;
# """.format(rollno))

# print("\nSemester 8: ",end=" ")
# for x in cursor:
#   print(x[0],end=',')

print("\n")
cursor.execute("""
select cid from curriculum
where number = 1 and cid not like 'HS101'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 1;
""".format(rollno))

print("Semester 1: ",end=" ")

for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 2 and cid not like 'SA1__'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 2;
""".format(rollno))

print("\nSemester 2: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 3 and cid not like 'SA2__' AND cid not like 'HS200'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 3;
""".format(rollno))

print("\nSemester 3: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 4 and cid not like 'HS1_' AND cid not like 'SA3_' AND cid not like '%M'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 4;
""".format(rollno))

print("\nSemester 4: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 5 and cid not like 'SA4__' AND cid not like '%M'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 5;
""".format(rollno))

print("\nSemester 5: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 6 and cid not like '%M'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 6;
""".format(rollno))

print("\nSemester 6: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 7 and cid like 'CS498'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 7;
""".format(rollno))

print("\nSemester 7: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

cursor.execute("""
select cid from curriculum
where number = 8 and cid like 'CS499'
EXCEPT
select cid
from grade18 natural join course18
where roll_number = {} and semester = 8;
""".format(rollno))

print("\nSemester 8: ",end=" ")
for x in cursor:
  print(x[0],end=' ')

print("\n")

# Task 4g


cursor.execute("select number,cid from curriculum  where ((cid LIKE 'CS5__' OR cid LIKE 'CS6__' OR cid LIKE 'CS7__' OR cid LIKE 'CS8__' or cid='CSxxx' ) and cid not in (select cid from grade18 where roll_number={})) ;".format(rollno))
data=cursor.fetchall()
print("\n\nSemester for which some electives are not taken:")
for x in data:
    print(f"{x[0]}    {x[1]}")


# Task 4h


print("\nPrescribed minor Courses taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                    and cid like '%M'
                          order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")
print("\nPrescribed minor Courses not taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid not in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                                 and cid like '%M'
                    order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")


# Task 4i

print("\nPrescribed Open Elective Courses taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                    and cid like 'OE%'
                          order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")
print("\nPrescribed Open Elective Courses not taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid not in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                                 and cid like 'OE%'
                    order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")


# Task 4j

print("\nPrescribed HSS Courses taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                    and cid like 'HS%'
                          order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")
print("\nPrescribed HSS Courses not taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid not in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                                 and cid like 'HS%'
                    order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")

# Task 4k

print("\nPrescribed SA Courses taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                    and cid like 'SA%'
                          order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")
print("\nPrescribed  SA Courses not taken")
print("Sem CID")
cursor.execute(f"""select number,cid
                    from curriculum
                    where cid not in (select cid
                                    from curriculum natural join grade18
                                    where roll_number={rollno})
                                 and cid like 'SA%'
                    order by number""")
myresult = cursor.fetchall()
for x in myresult:
    print(f"{x[0]}   {x[1]}")


# tASK 4L

print("\n")
cursor.execute("""
SELECT COUNT(*) 
FROM course18 NATURAL JOIN grade18 NATURAL JOIN conversion
WHERE roll_number = {} AND cr < 4 AND cid!='PP' group by semester
ORDER BY semester
""".format(rollno))
data=set(cursor.fetchall())
print("\nNo of semesters failed")
print(data)
print("\nNo of semesters passed")
print(set(range(1,9))-data)

# Task 4m

print("\n")
cursor.execute("""
SELECT COUNT(*) , "YES"
FROM course18 NATURAL JOIN grade18 NATURAL JOIN conversion
WHERE roll_number = {} AND cid LIKE "SA%" AND cr < 4 AND cid!='PP' group by semester
ORDER BY semester
""".format(rollno))
data=set(cursor.fetchall())
print("\nNo of semesters failed")
print(data)
print("\nNo of semesters passed")
print(set(range(1,9))-data)

mycon.close()
