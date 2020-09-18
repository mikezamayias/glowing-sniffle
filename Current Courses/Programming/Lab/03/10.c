/*
Γράψτε ένα πρόγραμμα, το οποίο να ζητά από τον χρήστη να διαβάσει
δύο συμβολοσειες, τις pin και mat. Να τις εμφανίζει στην οθόνη.
Στην συνέχεια να αντιγράφει την μικρότερη στην μεγαλύτερη και να
εμφανίζει και πάλι τις συμβολοσειρές στην οθόνη.
*/

#include <stdio.h>
#include <string.h>

#define STRING_LENGTH 40

int main()
{
    char pin[STRING_LENGTH], mat[STRING_LENGTH];

    printf("Δώστε μία συμβολοσειρά:\t\t");
    scanf("%[^\n]%*c", pin);
    printf("Δώστε μία ακόμη συμβολοσειρά:\t");
    scanf("%[^\n]%*c", mat);

    printf("%s\n", pin);
    printf("%s\n", mat);

    if (strcmp(pin, mat) > 0)
    {
        strcat(pin, mat);
    }
    else if (strcmp(pin, mat) < 0)
    {
        strcat(mat, pin);
    }

    printf("%s\n", pin);
    printf("%s\n", mat);

    return 0;
}
