#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <stdlib.h>



void bubbleSort( int n,int a[]) {
    for (int i=0;i<n-1;i++){
        bool flag=true;
        for (int j=0;i<n-j-1;j++){
            if (a[j]>a[j+1]){
                int temp=a[j];
                a[j]=a[j+1];
                a[j+1]=temp;
                flag=false;
            }
        }
        if (flag) break;
    }

    //for (int i=0;i<n;i++){printf("%d,",a[i]);}
}

// function to print array elements
void printArray( int array[], int size) {
  for ( int i = 0; i < size; ++i) {
    printf("%d  ", array[i]);
  }
  printf("\n");
}


void sortfile(int n,char name[],char newname[]){
    clock_t t,a;
    t = clock();
    int *arr=malloc(n*sizeof(int));
    FILE *f1;
    f1=fopen(name,"r");
    for(unsigned int i=0;i<n;i++){
        fscanf(f1,"%d",&arr[i]);
    }
    a=clock();
    bubbleSort(n,arr);
    a=clock()-a;
    fclose(f1);
    f1=fopen(newname,"w");
    for(unsigned int i=0;i<n;i++){
        fprintf(f1,"%d\n",arr[i]);
    }
    t = clock() - t;
    free(arr);
    fclose(f1);
    double time_taken_write = ((double)t)/CLOCKS_PER_SEC; // in seconds
    double time_taken = ((double)a)/CLOCKS_PER_SEC; // in seconds
    printf("FILE %s\n",name);
    printf("Sorting took %f seconds to execute \n", time_taken);
    printf("Sorting and writing took %f seconds to execute \n\n", time_taken_write);
    f1=fopen("../task6/210101092-output.txt","a");
    fprintf(f1,"Integers %5dK %20g %20g\n",n/1000,time_taken,time_taken_write);
    fclose(f1);
    // for(unsigned int i=0;i<n;i++){
    //     printf("%d\n",arr[i]);
    // }
    

}



int main(int argc, char const *argv[])
{
    sortfile(10000,"../task1a/i10k.txt","bi10k.txt");
    sortfile(20000,"../task1a/i20k.txt","bi20k.txt");
    sortfile(40000,"../task1a/i40k.txt","bi40k.txt");
    sortfile(80000,"../task1a/i80k.txt","bi80k.txt");
    sortfile(160000,"../task1a/i160k.txt","bi160k.txt");
    sortfile(320000,"../task1a/i320k.txt","bi320k.txt");
    sortfile(640000,"../task1a/i640k.txt","bi640k.txt");
    sortfile(1280000,"../task1a/i1280k.txt","bi1280k.txt");
    sortfile(2560000,"../task1a/i2560k.txt","bi2560k.txt");
    sortfile(5120000,"../task1a/i5120k.txt","bi5120k.txt");
    
    return 0;
}
