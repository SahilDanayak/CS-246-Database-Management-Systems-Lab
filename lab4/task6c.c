#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>


int main(){
    FILE *f1,*f2,*f3;
    char cid[10];
    char cname[60];

    f1 = fopen("hss_courses.csv","r");
    // f3= fopen("additional_hss_course.csv","r");
    f2=fopen("task6c.sql","w");
    fprintf(f2,"INSERT INTO hss_course01 (cid,cname) VALUES \n");
    for(int i = 0; i < 21; i++){
        fscanf(f1,"%[^,]%*c", cid);
        fscanf(f1,"%[^\n]%*c", cname);
        fprintf(f2,"('%s','%s'),\n",cid,cname);
    }
    fclose(f1);
    fclose(f2);
    // fclose(f3);
    
    
}