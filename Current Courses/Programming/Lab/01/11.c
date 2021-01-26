/*
Να γράψετε ένα πρόγραμμα που να εκτυπώνει στην οθόνη το όνομα και το επίθετό σας σε
μία γραμμή με μια printf(), σε δύο γραμμές με μία printf() και σε μία γραμμή με δύο
ξεχωριστές printf().
*/

#include <stdio.h>

int main()
{
    char *first_name, *last_name;

    first_name = "Μιχαήλ Ανάργυρος";
    last_name = "Ζαμάγιας";

    printf("one line, one printf\n");
    printf("%s %s\n", first_name, last_name);
    printf("two lines, one printf\n");
    printf("%s\n%s\n", first_name, last_name);
    printf("one line, two printfs\n");
    printf("%s ", first_name);
    printf("%s\n", last_name);

    return 0;
}
