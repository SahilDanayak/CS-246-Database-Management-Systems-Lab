#include <stdio.h>
#include <stdbool.h>


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
        char mon[4]={char1,char2,char3};
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


        //printf("  %d , %s ,%d, ",date,mon,year);

    }
}

void printArray(int array[], int size) {
  for (int i = 0; i < size; ++i) {
    printf("%d  ", array[i]);
  }
  printf("\n");
}

void printdate(int array[],int size){
    for (int i = 0; i < size; ++i) {
        int mon=array[i]%10000;
        mon=mon/100;
        char month[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

        printf("%d-%s-%d, ",array[i]%100,month[mon-1],array[i]/10000);
    }
    printf("\n");
}

void sortfile(int n,char name[]){
    int arr[n];
    file_to_array(n,"../task1b/d10k.txt",arr);
    //printArray(arr,n);
    quickSort(arr,0,n-1);
    //printArray(arr,n);
    printdate(arr,n);
}

int main(int argc, char const *argv[])
{
    /* code */
    sortfile(10000,"../task1b/d10k.txt");
    sortfile(20000,"../task1b/d20k.txt");
    sortfile(40000,"../task1b/d40k.txt");
    sortfile(80000,"../task1b/d80k.txt");
    sortfile(160000,"../task1b/d160k.txt");
    sortfile(320000,"../task1b/d320k.txt");
    sortfile(640000,"../task1b/d640k.txt");
    sortfile(1280000,"../task1b/d1280k.txt");
    sortfile(2560000,"../task1b/d2560k.txt");
    sortfile(5120000,"../task1b/d5120k.txt");
    return 0;
}
