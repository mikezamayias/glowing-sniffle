/*
Να γράψετε ένα πρόγραμμα, στο οποίο να δίνονται τιμές σε δύο ακέραιες μεταβλητές,
τις οποίες θα εμφανίζεται στην οθόνη. Στη συνέχεια να εναλλάσσονται οι τιμές των
μεταβλητών και οι εναλλαγμένες τιμές να εμφανίζονται και πάλι στην οθόνη.
*/

#include <stdio.h>


int main()
{
    int a = 3, b = 5, c;

    printf("a = %i, b = %i\n", a, b);

    c = b;
    b = a;
    a = c;

    printf("a = %i, b = %i\n", a, b);

    return 0;
}