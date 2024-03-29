#include <stdio.h>
#include<stdlib.h>
#include <string.h>

void read(char name[]){
    FILE *f1;
    char ch;
    f1=fopen(name,"r");
    if (f1==NULL) {
        printf("file can't be opened \n");
    }
 
    printf("content of %s file are \n",name);
 
    do {
        ch = fgetc(f1);
        printf("%c", ch);
 
    } while (ch != EOF);
    fclose(f1);
}



int main(int argc, char const *argv[])
{
    read("../task1a/i10k.txt");
    read("../task1a/i20k.txt");
    read("../task1a/i40k.txt");
    read("../task1a/i80k.txt");
    read("../task1a/i160k.txt");
    read("../task1a/i320k.txt");
    read("../task1a/i640k.txt");
    read("../task1a/i1280k.txt");
    read("../task1a/i2560k.txt");
    read("../task1a/i5120k.txt");
    read("../task1b/d10k.txt");
    read("../task1b/d20k.txt");
    read("../task1b/d40k.txt");
    read("../task1b/d80k.txt");
    read("../task1b/d160k.txt");
    read("../task1b/d320k.txt");
    read("../task1b/d640k.txt");
    read("../task1b/d1280k.txt");
    read("../task1b/d2560k.txt");
    read("../task1b/d5120k.txt");
    read("../task1c/dt10k.txt");
    read("../task1c/dt20k.txt");
    read("../task1c/dt40k.txt");
    read("../task1c/dt80k.txt");
    read("../task1c/dt160k.txt");
    read("../task1c/dt320k.txt");
    read("../task1c/dt640k.txt");
    read("../task1c/dt1280k.txt");
    read("../task1c/dt5120k.txt");
    return 0;
}
