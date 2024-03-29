#include <stdio.h>
#include <string.h>
#include <stdlib.h>


typedef struct _course{
    int sem;
    char cno[10];
    char cname[50];
    int lect;
    int prac;
    int tut;
    int cr;

} course;

typedef struct _grade{
    int rno;
    char cno[10];
    char grade[10];

} grade;


typedef struct _student{
    char name[50];
    int rollno;

} student;

typedef struct _task2a{
    char name[50];
    char cname[50];
    int cr;
    char grade[10];

} task2a;

/* Quick sort algorithm to sort strings */
#include <unistd.h>
//#include "quicksort.h"

/* Swaps position of strings in array (char**) */
void swap(task2a *a, task2a *b) {
    char nm[50];
    strcpy(nm,a->name);
    char cname[50];
    strcpy(cname,a->cname);
    //char  cred[10];
    //strcpy(cred,a->cr);
    int cred=a->cr;
    char grad[10];
    strcpy(grad,a->grade);
    strcpy(a->name,b->name);
    strcpy(a->cname,b->cname);
    a->cr=b->cr;
    //strcpy(a->cr,b->cr);
    strcpy(a->grade,b->grade);
    strcpy(b->name,nm);
    strcpy(b->cname,cname);
    b->cr=cred;
    //strcpy(b->cr,cred);
    strcpy(b->grade,grad);


}

void quicksort(task2a arr[], unsigned int length) {
	unsigned int i, piv = 0;
	if (length <= 1) 
		return;
	
	for (i = 0; i < length; i++) {
		// if curr str < pivot str, move curr into lower array and  lower++(pvt)
		if (strcasecmp(arr[i].name, arr[length -1].name) < 0) 	//use string in last index as pivot
			swap(arr + i, arr + piv++);		
	}
	//move pivot to "middle"
	swap(arr + piv, arr + length - 1);

	//recursively sort upper and lower
	quicksort(arr, piv++);			//set length to current pvt and increase for next call
	quicksort(arr + piv, length - piv);
}

void quicksort2(task2a arr[], unsigned int length) {
	unsigned int i, piv = 0;
	if (length <= 1) 
		return;
	
	for (i = 0; i < length; i++) {
		// if curr str < pivot str, move curr into lower array and  lower++(pvt)
		if (strcasecmp(arr[i].name, arr[length -1].name) < 0) 	//use string in last index as pivot
			swap(arr + i, arr + piv++);		
        else if (strcmp(arr[i].name, arr[length -1].name) ==0){
            if (arr[i].cr< arr[length -1].cr )
               {swap(arr + i, arr + piv++);}	 
        }

	}
	//move pivot to "middle"
	swap(arr + piv, arr + length - 1);

	//recursively sort upper and lower
	quicksort(arr, piv++);			//set length to current pvt and increase for next call
	quicksort(arr + piv, length - piv);
}


// void quicksort3(task2a arr[], unsigned int length) {
// 	unsigned int i, piv = 0;
// 	if (length <= 1) 
// 		return;
	
// 	for (i = 0; i < length; i++) {
// 		// if curr str < pivot str, move curr into lower array and  lower++(pvt)
// 		if (strcasecmp(arr[i].name, arr[length -1].name) < 0) 	//use string in last index as pivot
// 			swap(arr + i, arr + piv++);		
//         if (strcasecmp(arr[i].name, arr[length -1].name) ==0){
//             if (atoi(arr[i].cr)<atoi( arr[length -1].cr) )
//                {swap(arr + i, arr + piv++);}
//             if (atoi(arr[i].cr)==atoi( arr[length -1].cr))
//                 {if (strcasecmp(arr[i].grade, arr[length -1].grade) < 0)
//                     swap(arr + i, arr + piv++);}

//         }

// 	}
// 	//move pivot to "middle"
// 	swap(arr + piv, arr + length - 1);

// 	//recursively sort upper and lower
// 	quicksort(arr, piv++);			//set length to current pvt and increase for next call
// 	quicksort(arr + piv, length - piv);
// }


int main(){
    course courses[64];
    grade *grades=(grade*) malloc (9954 * sizeof(grade));
    student *students=(student*) malloc (158 * sizeof(student));
    FILE *f1;
    task2a *task2as=(task2a*) malloc (9954* sizeof(task2a));
    char namefromid[23100][50];
    f1=fopen("courses01.csv","r");
    for(int i = 0; i < 63; i++){
        fscanf(f1,"%d,", &courses[i].sem);
        fscanf(f1,"%[^,]%*c", courses[i].cno);
        fscanf(f1,"%[^,]%*c", courses[i].cname);
        fscanf(f1,"%d,", &courses[i].lect);
        fscanf(f1,"%d,", &courses[i].prac);
        fscanf(f1,"%d,", &courses[i].tut);
        fscanf(f1,"%d,", &courses[i].cr);
        //printf("Sem: %d Courseno: %s Coursename: %s Lectures: %d Practical: %d Tutorial: %d Credit: %d\n",courses[i].sem,courses[i].cno,courses[i].cname,courses[i].lect,courses[i].prac,courses[i].tut,courses[i].cr);
    }

    fclose(f1);

    f1=fopen("grades01.csv","r");
    for(int i = 0; i < 9954; i++){
        fscanf(f1,"%d,", &grades[i].rno);
        fscanf(f1,"%[^,]%*c", grades[i].cno);
        fscanf(f1,"%[^\n]%*c", grades[i].grade);
        //printf("ID: %d Courseno: %s Grade: %s\n",grades[i].rno,grades[i].cno,grades[i].grade);
    }

    fclose(f1);

    f1=fopen("students01.csv","r");
    for(int i = 0; i < 158 ; i++){
        fscanf(f1,"%[^,]%*c", students[i].name);
        fscanf(f1,"%d\n", &students[i].rollno);
        //printf("Name: %s Roll No: %d \n",students[i].name,students[i].rollno);
        //memcpy(namefromid[students[i].rollno-180100000],students[i].name, strlen(students[i].name));
        strcpy(namefromid[students[i].rollno-180100000],students[i].name);

    }

    fclose(f1);
    for(int i = 0; i <9954; i++){
        int j;
        for(j = 0; j < 63; j++){
            if (strcmp(grades[i].cno,courses[j].cno)==0) {break;}
        }

        strcpy(task2as[i].name,namefromid[grades[i].rno-180100000]);
        char cr[10];
        sprintf(cr, "%d", courses[j].cr);
        //strcpy(task2as[i].cr,cr );
        task2as[i].cr=courses[j].cr;
        strcpy(task2as[i].cname,courses[j].cname);
        strcpy(task2as[i].grade,grades[i].grade);
        printf("%d ID: %s Courseno: %s Grade: %s grade: %s\n",i,students[i%158].name,task2as[i].cr,task2as[i].cname,task2as[i].grade);
        printf("%d ID: %s Courseno: %s Grade: %s grade: %s\n",i,task2as[i].name,task2as[i].cr,task2as[i].cname,task2as[i].grade);
    }
    quicksort2(task2as, 9954);
    FILE* fp = fopen("grades-sorted-Q.csv", "w");
    for(int i = 0; i <9954; i++){
        fprintf(fp, "%s, %d, %s, %s\n",task2as[i].name,task2as[i].cname,task2as[i].cr,task2as[i].grade);
        //printf("%d ID: %s Courseno: %s Grade: %s grade: %s\n",i,task2as[i].name,task2as[i].cr,task2as[i].cname,task2as[i].grade);
    }
    fclose(fp);

    
    
}