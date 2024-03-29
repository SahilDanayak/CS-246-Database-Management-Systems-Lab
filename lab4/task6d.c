#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>


int main(){
    FILE *f1,*f2;
    char sno[10];
    char rno[12];
    char name[50];
    char cid[10];
    char cname[60];

    f1 = fopen("violate_fk.csv","r");
    f2=fopen("task6d.sql","w");
    fprintf(f2,"INSERT INTO hss_table05 (sno, roll_number, sname, cid,cname) VALUES ");
    for(int i = 0; i < 9; i++){
        fscanf(f1,"%[^,]%*c", sno);
        fscanf(f1,"%[^,]%*c", rno);
        fscanf(f1,"%[^,]%*c", name);
        fscanf(f1,"%[^,]%*c", cid);
        fscanf(f1,"%[^\n]%*c", cname);
        fprintf(f2,"\n('%s', '%s', '%s','%s','%s')",sno,rno,name,cid,cname);
        fprintf(f2,"%c",i==8?';':',');
    }
    fclose(f1);
    fclose(f2);
    
}