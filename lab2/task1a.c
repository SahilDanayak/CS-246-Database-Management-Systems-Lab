#include <stdio.h>
#include<stdlib.h>
int main() {
    FILE *f1;
    f1=fopen("i10k.txt","w");
    for(unsigned int i=0;i<10000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);


    f1=fopen("i20k.txt","w");
    for(unsigned int i=0;i<20000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);


    f1=fopen("i40k.txt","w");
    for(unsigned int i=0;i<40000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);


    f1=fopen("i80k.txt","w");
    for(unsigned int i=0;i<80000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    f1=fopen("i160k.txt","w");
    for(unsigned int i=0;i<160000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    f1=fopen("i320k.txt","w");
    for(unsigned int i=0;i<320000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    f1=fopen("i640k.txt","w");
    for(unsigned int i=0;i<640000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    f1=fopen("i1280k.txt","w");
    for(unsigned int i=0;i<1280000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    f1=fopen("i2560k.txt","w");
    for(unsigned int i=0;i<2560000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    f1=fopen("i5120k.txt","w");
    for(unsigned int i=0;i<5120000;i++){
        fprintf(f1,"%d \n",rand()%1000000);
    }
    fclose(f1);

    return 0;
}