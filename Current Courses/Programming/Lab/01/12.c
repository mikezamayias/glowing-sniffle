/*
Να γράψετε ένα πρόγραμμα, στο οποίο να δηλώσετε δύο μεταβλητές. Η μία θα έχει τιμή
όση η ηλικία σας σε έτη. Το πρόγραμμα θα υπολογίζει την ηλικία σας σε μήνες και θα
την εμφανίζει στην οθόνη.
*/

#include <stdio.h>


int main()
{
    int age, months = 12;

    age = 20;

    printf("You're %i years old, or %i months old.\n", age, age * months);

    return 0;
}
