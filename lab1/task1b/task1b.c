#include <stdio.h>
#include<stdlib.h>

int main() {
    FILE *f1;
    f1=fopen("d10k.txt","w");
    char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    for(unsigned int i=0;i<10000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);

    f1=fopen("d20k.txt","w");
    for(unsigned int i=0;i<20000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);

    f1=fopen("d40k.txt","w");
    for(unsigned int i=0;i<40000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);


    f1=fopen("d80k.txt","w");
    for(unsigned int i=0;i<80000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);
    f1=fopen("d160k.txt","w");
    for(unsigned int i=0;i<160000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);

    f1=fopen("d320k.txt","w");
    for(unsigned int i=0;i<320000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);

    f1=fopen("d640k.txt","w");
    for(unsigned int i=0;i<640000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);

    f1=fopen("d1280k.txt","w");
    for(unsigned int i=0;i<1280000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);
    f1=fopen("d2560k.txt","w");
    for(unsigned int i=0;i<2560000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);
    f1=fopen("d5120k.txt","w");
    for(unsigned int i=0;i<5120000;i++){
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2023) && (mon>1) ) || ((year==2023) && (mon==1) && (date>9))) {i--;continue;}
        if (((year==1948) && (mon<8) ) || ((year==1948) && (mon==8) && (date<15))) {i--;continue;}
        fprintf(f1,"%d-%s-%d\n",date,month[mon],year); 
    }
    fclose(f1);

    return 0;
}













// #include <stdio.h>
// #include<stdlib.h>
// #include <string.h>

// void generate_date(int dates,char name[]){
//     FILE *f1;
//     f1=fopen(name,"w");
//     for (unsigned int i=0;i<dates;i++){
//         int date=rand()%31;
//         int mon=rand()%12;
//         int year=rand()%(2022-1947)+ 1947;
//         if (year==1947 && mon<8) {generate_date(dates,name);}
//         if (year==1947 && mon==8 && date) {generate_date(dates,name);}

//     }
// }

// int main() {
//     FILE *f1;
//     f1=fopen("i10k.txt","w");
//     for(unsigned int i=0;i<10000;i++){
//         fprintf(f1,"%d \n",rand()%1000000);
//     }
//     fclose(f1);


//     f1=fopen("i20k.txt","w");
//     for(unsigned int i=0;i<20000;i++){
//         fprintf(f1,"%d \n",rand()%1000000);
//     }
//     fclose(f1);


//     f1=fopen("i40k.txt","w");
//     for(unsigned int i=0;i<40000;i++){
//         fprintf(f1,"%d \n",rand()%1000000);
//     }
//     fclose(f1);


//     f1=fopen("i80k.txt","w");
//     for(unsigned int i=0;i<80000;i++){
//         fprintf(f1,"%d \n",rand()%1000000);
//     }
//     fclose(f1);

//     return 0;
// }