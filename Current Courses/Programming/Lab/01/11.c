/*
Να γράψετε ένα πρόγραμμα που να εκτυπώνει στην οθόνη το όνομα κια το επίθετό σας σε
μία γραμμή με μια printf(), σε δύο γραμμές με μία printf() και σε μία γραμμή με δύο
ξεχωριστές printf().
*/

#include <stdio.h>

int main()
{
    char *first_name, *last_name;

    first_name = "Μιχαήλ Ανάργυρος";
    last_name = "Ζαμάγιας";

    printf("I\n");
    printf("%s %s\n", first_name, last_name);
    printf("II\n");
    printf("%s\n%s\n", first_name, last_name);
    printf("III\n");
    printf("%s ", first_name);
    printf("%s\n", last_name);

    return 0;
}
