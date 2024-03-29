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
cursor.execute('use week11;')

for i in range(1,14):
    if i<10: name="0"+str(i)
    else : name=str(i)
    cursor.execute("""CALL sp2 ("Employee {}","emp_boss_small");""".format(name))


for i in range(1,51):
    if i<10: name="0"+str(i)
    else : name=str(i)
    cursor.execute("""CALL sp2 ("Employee {}","emp_boss_large");""".format(name))


cursor.close()
mycon.close()