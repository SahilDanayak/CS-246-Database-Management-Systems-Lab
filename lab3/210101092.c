#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

struct task2a{
    char name[100];
    char cname[100];
    int C;
    char grd[10];
}t[9954];
struct course{
    int sem;
    int L, T, P, C;
    char cname[100];
    char cornum[10];
}c[63];
struct grades{
    int roll;
    char cor[10];
    char grd[10];
}g[9954];
struct student{
    char name[100];
    int roll;
}s[158];

int hash(int rollno){
    int x = rollno%1000;
    rollno /= 1000;
    int y = (rollno%100)/10 *49;
    return y + x - 1;
}
void swap(int *a,int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}
void swapstr(char *s1,char *str2)
{
    char *temp = (char *)malloc((strlen(s1) + 1) * sizeof(char));
    strcpy(temp, s1);
    strcpy(s1, str2);
    strcpy(str2, temp);
    free(temp);
}

void gswap(struct task2a *g1,struct task2a *g2)
{
    swapstr(g1->name,g2->name);
    swapstr(g1->cname,g2->cname);
    swap(&g1->C,&g2->C);
    swapstr(g1->grd,g2->grd);
}
int partition1(struct task2a ar[],int a,int b){
    int i=a-1;
    for(int j=a;j<b;j++){
        int x = strcasecmp(ar[j].name,ar[b].name);
        if(x < 0){
            gswap(&ar[i+1],&ar[j]);
            i++;
        }
        else if(x == 0){
            if(ar[j].C > ar[b].C){
                gswap(&ar[i+1],&ar[j]);
                i++;
            }
            else if(ar[j].C == ar[b].C){
                int y = strcasecmp(ar[j].grd,ar[b].grd);
                if(y < 0){
                    gswap(&ar[i+1],&ar[j]);
                    i++;
                }
            }
        }
    }
    gswap(&ar[i+1],&ar[b]);
    return (i+1);
}

int partition3(struct task2a ar[],int a,int b){
    int i=a-1;
    for(int j=a;j<b;j++){
        int x = strcasecmp(ar[j].name,ar[b].name);
        if(x < 0){
            gswap(&ar[i+1],&ar[j]);
            i++;
        }
        
    }
    gswap(&ar[i+1],&ar[b]);
    return (i+1);
}

int partition2(struct task2a ar[],int a,int b){
    int i=a-1;
    for(int j=a;j<b;j++){
        int x = strcasecmp(ar[j].name,ar[b].name);
        if(x < 0){
            gswap(&ar[i+1],&ar[j]);
            i++;
        }
        else if(x == 0){
            if(ar[j].C > ar[b].C){
                gswap(&ar[i+1],&ar[j]);
                i++;
            }
        }
    }
    gswap(&ar[i+1],&ar[b]);
    return (i+1);
}

void quicksort(struct task2a ar[],int a, int b){
    if(a>=b){
        return;
    }
    int p=partition1(ar,a,b);
    quicksort(ar,a,p-1);
    quicksort(ar,p+1,b);
}
void gbubblesort1(struct task2a ar[]){
    int n = 9954;
    for(int i = 0; i < n-1; i++){
        for(int j = 0; j < n - i - 1; j++){
            int x = strcasecmp(ar[j].name,ar[j+1].name);
            if(x > 0){
                gswap(&ar[j],&ar[j+1]);
            }
            else if (x == 0){
                if(ar[j].C < ar[j+1].C){
                    gswap(&ar[j],&ar[j+1]);
                }
                else if (ar[j].C == ar[j+1].C){
                    int y = strcasecmp(ar[j].grd,ar[j+1].grd);
                    if(y > 0){
                        gswap(&ar[j],&ar[j+1]);
                    }
                }
            }
        }
    }
}
void gbubblesort3(struct task2a ar[]){
    int n = 9954;
    for(int i = 0; i < n-1; i++){
        for(int j = 0; j < n - i - 1; j++){
            int x = strcasecmp(ar[j].name,ar[j+1].name);
            if(x > 0){
                gswap(&ar[j],&ar[j+1]);
            }
        }
    }
}
void gbubblesort2(struct task2a ar[]){
    int n = 9954;
    for(int i = 0; i < n-1; i++){
        for(int j = 0; j < n - i - 1; j++){
            int x = strcasecmp(ar[j].name,ar[j+1].name);
            if(x > 0){
                gswap(&ar[j],&ar[j+1]);
            }
            else if (x == 0){
                if(ar[j].C < ar[j+1].C){
                    gswap(&ar[j],&ar[j+1]);
                }
            }
        }
    }
}
int main(){
    FILE *f1,*f2,*f3,*f4,*f5;
    char* roll_no_to_name[162];
    f1 = fopen("students01.csv","r");
    f2 = fopen("grades01.csv","r");
    f3 = fopen("courses01.csv","r");
    f4 = fopen("grades-sorted-Q.csv","w");
    f5 = fopen("grades-sorted-B.csv","w");
    for(int i = 0; i < 158; i++){
        fscanf(f1,"%[^,]%*c", s[i].name);
        fscanf(f1,"%d\n", &s[i].roll);
    }
    for(int i = 0; i < 9954; i++){
        fscanf(f2,"%d,", &g[i].roll);
        fscanf(f2,"%[^,]%*c", g[i].cor);
        fscanf(f2,"%[^\n]%*c", g[i].grd);
    }
    for(int i = 0; i < 63; i++){
        fscanf(f3,"%d,", &c[i].sem);
        fscanf(f3,"%[^,]%*c", c[i].cornum);
        fscanf(f3,"%[^,]%*c", c[i].cname);
        fscanf(f3,"%d,%d,%d,%d", &c[i].L, &c[i].T, &c[i].P, &c[i].C);
    }
    for(int i = 0; i < 158; i++){
        // printf("%s,%d\n",s[i].name,s[i].roll);
        roll_no_to_name[hash(s[i].roll)] = s[i].name;
    } 
    fclose(f1);
    fclose(f2);
    fclose(f3);
    for(int i = 0; i < 9954; i++){
        strcpy(t[i].name,roll_no_to_name[hash(g[i].roll)]);
        for(int j = 0; j < 63; j++){
            if(strcmp(g[i].cor,c[j].cornum) == 0){
                strcpy(t[i].cname,c[j].cname);
                t[i].C = c[j].C;
                break;
            }
        }
        strcpy(t[i].grd ,g[i].grd);
    }
    quicksort(t,0,9953);
    //gbubblesort1(t);
    for(int i = 0; i < 9954; i++){
        fprintf(f5,"%s,%s,%d,%s\n",t[i].name,t[i].cname,t[i].C,t[i].grd);
    }
    for(int i = 0; i < 9954; i++){
        fprintf(f4,"%s,%s,%d,%s\n",t[i].name,t[i].cname,t[i].C,t[i].grd);
    }
    fclose(f4);
    fclose(f5);
return 0;
}