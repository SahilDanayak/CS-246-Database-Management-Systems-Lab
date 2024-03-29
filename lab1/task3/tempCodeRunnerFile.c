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

}