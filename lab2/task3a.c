#include <stdio.h>

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



void sortfile(int n,char name[]){
    FILE *f1;
    f1=fopen(name,"r");
    int arr[n];
    for(unsigned int i=0;i<n;i++){
        fscanf(f1,"%d",&arr[i]);
    }
    quickSort(arr,0,n-1);
    for(unsigned int i=0;i<n;i++){
        printf("%d\n",arr[i]);
    }
    

}



int main(int argc, char const *argv[])
{
    sortfile(10000,"../task1a/i10k.txt");
    sortfile(20000,"../task1a/i20k.txt");
    sortfile(40000,"../task1a/i40k.txt");
    sortfile(80000,"../task1a/i80k.txt");
    sortfile(160000,"../task1a/i160k.txt");
    sortfile(320000,"../task1a/i320k.txt");
    sortfile(640000,"../task1a/i640k.txt");
    sortfile(1280000,"../task1a/i1280k.txt");
    sortfile(2560000,"../task1a/i2560k.txt");
    sortfile(5120000,"../task1a/i5120k.txt");

    return 0;
}
