#include <stdio.h>
#include<stdlib.h>
#include <string.h>

void genratetime(int limit){
    FILE *f1;
    char limitstr[10];
    sprintf(limitstr, "%d", limit/1000);
    char name2[15] = "dt";
    strcat(name2, limitstr);
    strcat(name2, "k.txt");
    f1=fopen(name2,"w");
    char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    for(unsigned int i=0;i<limit;i++){
        int sec=rand()%60;
        int min=rand()%60;
        int hr=rand()%24;
        int date=1+ rand()%28;
        int mon=rand()%12;
        int year=rand()%(2022-1948)+ 1948;
        if (((year==2022) && (mon>8) ) || ((year==2022) && (mon==8) && (date>15))) generatetime(limit);
        fprintf(f1,"%d-%s-%d %02d:%02d:%02d\n",date,month[mon],year,hr,min,sec); 
    }
    fclose(f1);
}

int main(int argc, char const *argv[])
{
    genratetime(10000);
    genratetime(20000);
    genratetime(40000);
    genratetime(80000);
    genratetime(160000);
    genratetime(320000);
    genratetime(640000);
    genratetime(1280000);
    genratetime(2560000);
    genratetime(5120000);

    return 0;
}



// int main() {
//     FILE *f1;
//     f1=fopen("i10k.txt","w");
//     char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
//     for(unsigned int i=0;i<10000;i++){
//         int sec=rand()%60;
//         int min=rand()%60;
//         int hr=rand()%24;
//         int date=1+ rand()%28;
//         int mon=rand()%12;
//         int year=rand()%(2022-1948)+ 1948;
//         fprintf(f1,"%d-%s-%d %02d:%02d:%02d\n",date,month[mon],year,hr,min,sec); 
//     }
//     fclose(f1);

//     return 0;

// }