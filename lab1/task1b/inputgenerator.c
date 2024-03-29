#include <stdio.h>
#include<stdlib.h>
#include <string.h>

#define int long long int

void Date_and_time_stamp_input_generator_helper(FILE *ptr,int i){
  int date,mon,yr,hr,min,sec;
  char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
  
  for(int j = 0; j < i; j++){
        yr = 1947 + (rand() % 76);
        if(yr == 1947){
                  mon = 7 + rand() % 5;
                  if(mon == 7){ date = 15 + rand() % 17; }
                  else{ date = 1 + rand() % 31; }
               }
        else if(yr == 2023){  mon = 0;
                  date = 1 + rand() % 9; 
               }
        else{ mon = rand() % 12; date = 1 + rand() % 31; }
        
        hr = rand() % 24; min = rand() % 60; sec = rand() % 60;
        
        fprintf(ptr,"%02lld-%s-%lld %02lld:%02lld:%02lld\n",date,month[mon],yr,hr,min,sec);
      }
}

void Date_input_generator_helper(FILE *ptr,int i){
  int date,mon,yr;
  char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
  
  for(int j = 0; j < i; j++){
        yr = 1947 + (rand() % 76);
        if(yr == 1947){
                  mon = 7 + rand() % 5;
                  if(mon == 7){ date = 15 + rand() % 17; }
                  else{ date = 1 + rand() % 31; }
               }
        else if(yr == 2023){  mon = 0;
                  date = 1 + rand() % 9; 
               }
        else{ mon = rand() % 12; date = 1 + rand() % 31; }
        
        
        fprintf(ptr,"%02lld-%s-%lld\n",date,month[mon],yr);
      }
}

void createfiledt(int n){
    FILE *f1;
    char limitstr[10];
    sprintf(limitstr, "%lld", n/1000);
    char name2[15] = "dt";
    strcat(name2, limitstr);
    strcat(name2, "k.txt");
    f1=fopen(name2,"w");
    Date_and_time_stamp_input_generator_helper(f1,n);
    fclose(f1);
}

void createfiled(int n){
    FILE *f1;
    char limitstr[10];
    sprintf(limitstr, "%lld", n/1000);
    char name2[15] = "d";
    strcat(name2, limitstr);
    strcat(name2, "k.txt");
    f1=fopen(name2,"w");
    Date_input_generator_helper(f1,n);
    fclose(f1);
}

int main(){
    createfiledt(10000);
    createfiled(10000);
    createfiledt(20000);
    createfiled(20000);
    createfiledt(40000);
    createfiled(40000);
    createfiledt(80000);
    createfiled(80000);
    createfiledt(160000);
    createfiled(160000);
    createfiledt(320000);
    createfiled(320000);
    createfiledt(640000);
    createfiled(640000);
    createfiledt(1280000);
    createfiled(1280000);
    createfiledt(2560000);
    createfiled(2560000);
    createfiledt(5120000);
    createfiled(5120000);
}
