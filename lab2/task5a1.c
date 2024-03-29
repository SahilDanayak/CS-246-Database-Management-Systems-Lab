#include <stdio.h>
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



void sortfile(int n,char name[],char newname[]){
    clock_t t,a;
    //printf("hi1");
    t = clock();
    FILE *f1;
    f1=fopen(name,"r");
    int *arr=malloc(n*sizeof(int));
    //printf("hi2");
    for(unsigned int i=0;i<n;i++){
        fscanf(f1,"%d",&arr[i]);
    }
    a=clock();
    quickSort(arr,0,n-1);
    a=clock()-a;
    fclose(f1);
    f1=fopen(newname,"w");
    for(unsigned int i=0;i<n;i++){
        fprintf(f1,"%d\n",arr[i]);
    }

    t = clock() - t;
    free(arr);
    double time_taken_write = ((double)t)/CLOCKS_PER_SEC; // in seconds
    double time_taken = ((double)a)/CLOCKS_PER_SEC; // in seconds
    printf("FILE %s\n",name);
    printf("Sorting took %f seconds to execute \n", time_taken);
    //printf("hi2.5");
    printf("Sorting and writing took %f seconds to execute \n\n", time_taken_write);
    //printf("hi3");    
    fclose(f1);
    f1=fopen("../task6/210101092-output.txt","a");
    fprintf(f1,"Integers %5dK %20g %20g\n",n/1000,time_taken,time_taken_write);
    fclose(f1);

}




int main(int argc, char const *argv[])
{
    sortfile(10000,"../task1a/i10k.txt","qi10k.txt");
    sortfile(20000,"../task1a/i20k.txt","qi20k.txt");
    sortfile(40000,"../task1a/i40k.txt","qi40k.txt");
    sortfile(80000,"../task1a/i80k.txt","qi80k.txt");
    sortfile(160000,"../task1a/i160k.txt","qi160k.txt");
    sortfile(320000,"../task1a/i320k.txt","qi320k.txt");
    sortfile(640000,"../task1a/i640k.txt","qi640k.txt");
    sortfile(1280000,"../task1a/i1280k.txt","qi1280k.txt");
    sortfile(2560000,"../task1a/i2560k.txt","qi2560k.txt");
    sortfile(5120000,"../task1a/i5120k.txt","qi5120k.txt");
    
    
    
    return 0;
}
