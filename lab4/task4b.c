#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>


int main(){
    FILE *f1,*f2,*f3;
    char sno[10];
    char rno[12];
    char name[50];
    char cid[10];
    char cname[60];

    f1 = fopen("hss_electives.csv","r");
    f3= fopen("additional_hss_course.csv","r");
    f2=fopen("task4b.sql","w");
    fprintf(f2,"INSERT INTO hss_table03 (sno, roll_number, sname, cid,cname) VALUES \n");
    for(int i = 0; i < 1431; i++){
        fscanf(f1,"%[^,]%*c", sno);
        fscanf(f1,"%[^,]%*c", rno);
        fscanf(f1,"%[^,]%*c", name);
        fscanf(f1,"%[^,]%*c", cid);
        fscanf(f1,"%[^\n]%*c", cname);
        fprintf(f2,"('%s', '%s', '%s','%s','%s'),\n",sno,rno,name,cid,cname);
    }
    for(int i = 0; i < 9; i++){
        fscanf(f3,"%[^,]%*c", sno);
        fscanf(f3,"%[^,]%*c", rno);
        fscanf(f3,"%[^,]%*c", name);
        fscanf(f3,"%[^,]%*c", cid);
        fscanf(f3,"%[^\n]%*c", cname);
        fprintf(f2,"('%s', '%s', '%s','%s','%s'),\n",sno,rno,name,cid,cname);
    }
    fclose(f1);
    fclose(f2);
    fclose(f3);
    
    
}