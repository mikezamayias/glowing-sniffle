#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define Students 2
#define NameLength 10

int main()
{
    int studentCounter;
    char students[Students][NameLength];

    printf("Enter the name(s) of %i student(s):\n", Students);
    for (studentCounter = 0; studentCounter < Students; studentCounter++)
    {
        fgets(students[studentCounter], NameLength, stdin);
    }

    printf("\nGiven names, unsorted\n");
    for (studentCounter = 0; studentCounter < Students; studentCounter++)
    {
        printf("%s", students[studentCounter]);
    }

    printf("\nGiven names, sorted:\n");
    for (studentCounter = 0; studentCounter < Students; studentCounter++)
    {
        printf("%s", students[studentCounter]);
    }

    return 0;
}

void studentsSort(char students[][NameLength])
{
    
}