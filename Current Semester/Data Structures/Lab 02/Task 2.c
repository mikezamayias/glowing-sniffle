#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define Students 2
#define NameLength 10

void sortStudentNames(char students[][NameLength]);

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
        printf("%i.\t%s", studentCounter, students[studentCounter]);
    }

    //  sort student names
    sortStudentNames(students);

    printf("\nGiven names, sorted:\n");
    for (studentCounter = 0; studentCounter < Students; studentCounter++)
    {
        printf("%i.\t%s", studentCounter, students[studentCounter]);
    }

    return 0;
}

void sortStudentNames(char students[][NameLength])
{
    int studentCounter, check;
    char tempStudent[NameLength];

    for (studentCounter = 0; studentCounter < Students; studentCounter++)
    {
        check = strcmp(students[studentCounter], students[studentCounter + 1]);
        if (check > 0)
        {
            strcpy(tempStudent, students[studentCounter]);
            strcpy(students[studentCounter], students[studentCounter + 1]);
            strcpy(students[studentCounter + 1], tempStudent);
        }
        if (studentCounter + 1 == Students)
        {
            break;
        }
    }
}