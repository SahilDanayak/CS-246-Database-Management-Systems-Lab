#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <stdlib.h>


void swap( int *a, int *b) {
   int t = *a;
  *a = *b;
  *b = t;
}

// function to find the partition position
 int partition( int array[], int low, int high) {
   int pivot = array[high];
   int i = (low - 1);
  for ( int j = low; j < high; j++) {
    if (array[j] <= pivot) {
      i++;
      swap(&array[i], &array[j]);
    }
  }
  swap(&array[i + 1], &array[high]);
  return (i + 1);
}

void quickSort( int array[], int low, int high) {
  if (low < high) {
     int pi = partition(array, low, high);
    quickSort(array, low, pi - 1);
    quickSort(array, pi + 1, high);
  }
}



void file_to_array(int n,char name[],int arr[]){
    FILE *f1;
    f1=fopen(name,"r");
    for(unsigned int i=0;i<n;i++){
        int date;
        char char1;
        char char2;
        char char3;
        int year;
        fscanf(f1,"%d-%c%c%c-%04d",&date,&char1,&char2,&char3,&year);
        char *mon = (char*)malloc(4 * sizeof(int));
        mon[0]=char1;
        mon[1]=char2;
        mon[2]=char3;   
        int num=year*10000+date;
        //{"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
        if (char1=='J' && char2=='a') num+=1*100;
        else if (char1=='F' ) num+=2*100;
        else if (char1=='M' && char3=='r') num+=3*100;
        else if (char1=='A' && char2=='p') num+=4*100;
        else if (char1=='M' && char3=='y') num+=5*100;
        else if (char1=='J' && char3=='n') num+=6*100;
        else if (char1=='J' && char3=='l') num+=7*100;
        else if (char1=='A' && char2=='u') num+=8*100;
        else if (char1=='S') num+=9*100;
        else if (char1=='O') num+=10*100;
        else if (char1=='N') num+=11*100;
        else if (char1=='D') num+=12*100;
        arr[i]=num;
        free(mon);
        //printf("  %d , %s ,%d, ",date,mon,year);

    }
    fclose(f1);
}

void printArray(int array[], int size) {
  for (int i = 0; i < size; ++i) {
    printf("%d  ", array[i]);
  }
  printf("\n");
}

void printdate(int array[],int size,char newname[]){
    FILE *f1;
    f1=fopen(newname,"w");
    char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    for (int i = 0; i < size; ++i) {
        int mon=array[i]%10000;
        mon=mon/100;
        
        fprintf(f1,"%d-%s-%d\n",array[i]%100,month[mon-1],array[i]/10000);
    }
    printf("\n");
    fclose(f1);
}

void sortfile(int n,char name[],char newname[]){
    clock_t t,a;
    t = clock();
    int *arr=malloc(n*sizeof(int));
    file_to_array(n,name,arr);
    a=clock();
    quickSort(arr,0,n-1);
    a=clock()-a;
    printdate(arr,n,newname);
    t = clock() - t;
    free(arr);
    double time_taken_write = ((double)t)/CLOCKS_PER_SEC; // in seconds
    double time_taken = ((double)a)/CLOCKS_PER_SEC; // in seconds
    printf("FILE %s\n",name);
    printf("Sorting took %f seconds to execute \n", time_taken);
    printf("Sorting and writing took %f seconds to execute \n\n", time_taken_write);
    FILE *f1=fopen("../task6/210101092-output.txt","a");
    fprintf(f1,"Date %5dK %20g %20g\n",n/1000,time_taken,time_taken_write);
    fclose(f1);
}

int main(int argc, char const *argv[])
{
    /* code */
    sortfile(10000,"../task1b/d10k.txt","qd10k.txt");
    sortfile(20000,"../task1b/d20k.txt","qd20k.txt");
    sortfile(40000,"../task1b/d40k.txt","qd40k.txt");
    sortfile(80000,"../task1b/d80k.txt","qd80k.txt");
    sortfile(160000,"../task1b/d160k.txt","qd160k.txt");
    sortfile(320000,"../task1b/d320k.txt","qd320k.txt");
    sortfile(640000,"../task1b/d640k.txt","qd640k.txt");
    sortfile(1280000,"../task1b/d1280k.txt","qd1280k.txt");
    sortfile(2560000,"../task1b/d2560k.txt","qd2560k.txt");
    sortfile(5120000,"../task1b/d5120k.txt","qd5120k.txt");
    return 0;
}
