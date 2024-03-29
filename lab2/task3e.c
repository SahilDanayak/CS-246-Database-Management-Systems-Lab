#include <stdio.h>
#include <stdbool.h>


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
        char mon[4]={char1,char2,char3};
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


        //printf("  %d , %s ,%d, ",date,mon,year);

    }
}

void printArray(long long int array[],long long int size) {
  for (long long int i = 0; i < size; ++i) {
    printf("%lld  ", array[i]);
  }
  printf("\n");
}

void printdate(long long int array[],int size){
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
        char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

        printf("%d-%s-%lld %02d:%02d:%02d, ",date,month[mon-1],array[i]/10000000000,hr,min,sec);
    }
    printf("\n");
}

void sortfile(long long int n,char name[]){
    long long int arr[n];
    file_to_array(n,name,arr);
    //printArray(arr,n);
    quickSort(arr,0,n-1);
    //printArray(arr,n);
    printdate(arr,n);
}

int main(int argc, char const *argv[])
{
    /* code */
    sortfile(10000,"../task1c/dt10k.txt");
    sortfile(20000,"../task1c/dt20k.txt");
    sortfile(40000,"../task1c/dt40k.txt");
    sortfile(80000,"../task1c/dt80k.txt");
    sortfile(160000,"../task1c/dt160k.txt");
    sortfile(320000,"../task1c/dt320k.txt");
    sortfile(640000,"../task1c/dt640k.txt");
    sortfile(1280000,"../task1c/dt1280k.txt");
    sortfile(2560000,"../task1c/dt2560k.txt");
    sortfile(5120000,"../task1c/dt5120k.txt");
    return 0;
}
