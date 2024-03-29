#include <stdio.h>
#include <stdbool.h>


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

    for (int i=0;i<n;i++){printf("%d,",a[i]);}
}

// function to print array elements
void printArray( int array[], int size) {
  for ( int i = 0; i < size; ++i) {
    printf("%d  ", array[i]);
  }
  printf("\n");
}


void sortfile(int n,char name[]){
    FILE *f1;
    f1=fopen(name,"r");
    int arr[n];
    for(unsigned int i=0;i<n;i++){
        fscanf(f1,"%d",&arr[i]);
    }
    bubbleSort(n,arr);
    // for(unsigned int i=0;i<n;i++){
    //     printf("%d\n",arr[i]);
    // }
    

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
