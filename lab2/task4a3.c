#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <stdlib.h>

void swap(long long int *a,long long int *b) {
    long long int t = *a;
  *a = *b;
  *b = t;
}

// function to find the partition position
 int partition(long long int array[],long long int low,long long int high) {
   long long int pivot = array[high];
   long long int i = (low - 1);
  for (long long int j = low; j < high; j++) {
    if (array[j] <= pivot) {
      i++;
      swap(&array[i], &array[j]);
    }
  }
  swap(&array[i + 1], &array[high]);
  return (i + 1);
}

void quickSort(long long int array[],long long int low,long long int high) {
  if (low < high) {
    long long int pi = partition(array, low, high);
    quickSort(array, low, pi - 1);
    quickSort(array, pi + 1, high);
  }
}



void file_to_array(long long int n,char name[],long long int arr[]){
    FILE *f1;
    f1=fopen(name,"r");
    for(unsigned long long int i=0;i<n;i++){
        int date;
        char char1;
        char char2;
        char char3;
        int year;
        int hr;
        int min;
        int sec;
        fscanf(f1,"%d-%c%c%c-%04d %02d:%02d:%02d",&date,&char1,&char2,&char3,&year,&hr,&min,&sec);
        char *mon = (char*)malloc(4 * sizeof(int));
        mon[0]=char1;
        mon[1]=char2;
        mon[2]=char3;   
        //printf("%d %s %d %d:%d:%d, ",year,mon,date,hr,min,sec );
        long long int num=year*10000000000+date*1000000;
        //{"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
        if (char1=='J' && char2=='a') num+=1*100000000;
        else if (char1=='F' ) num+=2*100000000;
        else if (char1=='M' && char3=='r') num+=3*100000000;
        else if (char1=='A' && char2=='p') num+=4*100000000;
        else if (char1=='M' && char3=='y') num+=5*100000000;
        else if (char1=='J' && char3=='n') num+=6*100000000;
        else if (char1=='J' && char3=='l') num+=7*100000000;
        else if (char1=='A' && char2=='u') num+=8*100000000;
        else if (char1=='S') num+=9*100000000;
        else if (char1=='O') num+=10*100000000;
        else if (char1=='N') num+=11*100000000;
        else if (char1=='D') num+=12*100000000;
        num+=hr*10000+min*100+sec;
        arr[i]=num;
        free(mon);

        //printf("  %d , %s ,%d, ",date,mon,year);

    }
}

void printArray(long long int array[],long long int size) {
  for (long long int i = 0; i < size; ++i) {
    printf("%lld  ", array[i]);
  }
  printf("\n");
}

void printdate(long long int array[],int size,char newname[]){
    FILE *f1;
    f1=fopen(newname,"w");
    char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    for (int i = 0; i < size; ++i) {
        int sec=array[i]%100;
        int min=array[i]%10000;
        min=min/100;
        int hr=array[i]%1000000;
        hr=hr/10000;
        int date=array[i]%100000000;
        date=date/1000000;
        int mon=array[i]%10000000000;
        mon=mon/100000000;
        fprintf(f1,"%d-%s-%lld %02d:%02d:%02d\n",date,month[mon-1],array[i]/10000000000,hr,min,sec);
    }
    printf("\n");
}

void sortfile(long long int n,char name[],char newname[]){
    clock_t t,a;
    t = clock();
    long int *arr=malloc(n*sizeof(long int));
    file_to_array(n,name,arr);
    a=clock();
    //printArray(arr,n);
    quickSort(arr,0,n-1);
    a=clock()-a;
    //printArray(arr,n);
    printdate(arr,n,newname);
    t = clock() - t;
    free(arr);
    double time_taken_write = ((double)t)/CLOCKS_PER_SEC; // in seconds
    double time_taken = ((double)a)/CLOCKS_PER_SEC; // in seconds
    printf("FILE %s\n",name);
    printf("Sorting took %f seconds to execute \n", time_taken);
    printf("Sorting and writing took %f seconds to execute \n\n", time_taken_write);
    FILE *f1=fopen("../task6/210101092-output.txt","a");
    fprintf(f1,"Date & Time %5dK %20g %20g\n",n/1000,time_taken,time_taken_write);
    fclose(f1);

}

int main(int argc, char const *argv[])
{
    /* code */
    sortfile(10000,"../task1c/dt10k.txt","qdt10k.txt");
    sortfile(20000,"../task1c/dt20k.txt","qdt20k.txt");
    sortfile(40000,"../task1c/dt40k.txt","qdt40k.txt");
    sortfile(80000,"../task1c/dt80k.txt","qdt80k.txt");
    sortfile(160000,"../task1c/dt160k.txt","qdt160k.txt");
    sortfile(320000,"../task1c/dt320k.txt","qdt320k.txt");
    sortfile(640000,"../task1c/dt640k.txt","qdt640k.txt");
    sortfile(1280000,"../task1c/dt1280k.txt","qdt1280k.txt");
    sortfile(2560000,"../task1c/dt2560k.txt","qdt2560k.txt");
    sortfile(5120000,"../task1c/dt5120k.txt","qdt5120k.txt");
    return 0;
}
