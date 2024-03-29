for i in range(1,50):
    if i<10: name="0"+str(i)
    else : name=str(i)
    print("""CALL sp2 ("Employee {}","emp_boss_large");""".format(name))

for i in range(1,14):
    if i<10: name="0"+str(i)
    else : name=str(i)
    print("""CALL sp2 ("Employee {}","emp_boss_small");""".format(name))