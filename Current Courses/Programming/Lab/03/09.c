/*
Γράψτε ένα πρόγραμμα, το οποίο να ζητά από τον
χρήστε το όνομα και το επώνυμό του. Στη συνέχεια
να εμφανίζει στη μια γραμμή τα ονόματα και στην
επόμενη γραμμή, κάτω από το τελευταίο γράμα του
καθενός, τον αριθμό των γραμμάτων του ονόματος
και του επωνύμου. Π.χ.:
Νικόλαος Αποστόλου
       8         9
Στη συνέχεια να εμφανίζει ξανά τα ίδια, αλλά με τον
αριθμό των γραμμάτων κάτω από το αρχικό γράμμα κάθε
ονόματος. Π.χ.:
Νικόλαος Αποστόλου
8        9
*/

#include <stdio.h>
#include <string.h>

#define NAME_LENGTH 30

int main()
{
    // char first_name[] = "Μιχαήλ Ανάργυρος", last_name[] = "Ζαμάγιας";
    // char first_name[] = "Μιχάλης", last_name[] = "Ζαμάγιας";
    char first_name[NAME_LENGTH], last_name[NAME_LENGTH];
    int c_first_name, c_last_name, i;

    printf("Δώστε το μικρό σας όνομα:\t");
    scanf("%[^\n]%*c", first_name);
    printf("Δώστε το επώνυμό σας:\t");
    scanf("%[^\n]%*c", last_name);

    c_first_name = strlen(first_name) / 2;
    c_last_name = strlen(last_name) / 2;

    printf("%s %s\n", first_name, last_name);

    for (i = 0; i < c_first_name - 1; i++)
    {
        printf(" ");
    }
    printf("%i ", c_first_name);
    for (i = 0; i < c_last_name - 1; i++)
    {
        printf(" ");
    }
    printf("%i\n", c_last_name);

    printf("%s %s\n", first_name, last_name);
    printf("%i ", c_first_name);
    for (i = 1; i < c_first_name - 1; i++)
    {
        printf(" ");
    }
    printf(" %i", c_last_name);
    for (i = 1; i < c_last_name - 1; i++)
    {
        printf(" ");
    }
    printf("\n");

    return 0;
}
