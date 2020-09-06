#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define number_of_students 2
#define name_length 30

struct student
{
    int student_id;
    char student_name[name_length];
};

int main()
{
    //  struct array
    struct student pin[number_of_students];
    int k;
    char buf[1024];

    //  enter data to array
    for (k = 0; k < number_of_students; k++)
    {
        //  print message
        printf("Enter Student's %i ID:\t", k + 1);
        //  read number as string
        fgets(buf, 1024, stdin);
        //  convert string to int
        pin[k].student_id = atoi(buf);
        //  print message
        printf("Enter Student's %i name:\t", k + 1);
        //  read string
        fgets(pin[k].student_name, name_length, stdin);
        //  trim \n at the end of the string
        pin[k].student_name[strcspn(pin[k].student_name, "\n")] = 0;
    }

    //  print data from array
    for (k = 0; k < number_of_students; k++)
    {
        printf("Student %2i\n", k + 1);
        printf("Student ID:\t%4i\n", pin[k].student_id);
        printf("Student name:\t%s\n", pin[k].student_name);
    }

    return 0;
}
