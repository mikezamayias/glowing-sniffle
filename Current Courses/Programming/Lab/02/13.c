/*
Να γραφεί ένα πρόγραμμα, στο οποίο να δηλώσετε ένα πίνακα
float 5 θέσεων, τον pin. Να διαβάσετε τιμές από το
πληκτρολόγιο, τις οποίες να καταχωρήσετε στις 5 θέσεις
του πίνακα. Στη συνέχεια να γράψετε τις τιμές του
πίνακα στην οθόνη ως εξής: σε μια γραμμή θα γράφεται
η τιμή του πρώτου στοιχείου του πίνακα με δύο δεκαδικά, θα
αφήνονται 5 κενά και δίπλα θα γράφεται η τιμή πάλι του
πρώτου στοιχείου του πίνακα με τρία δεκαδικά. Στην από κάτω
γραμμή θα γράφετεαι η τιμή του δεύτερου στοιχείου του πίνακα
με δύο δεκαδικά, θα αφήνονται 5 κενά και δίπλα θα γράφεται
η τιμή πάλι του δεύτερου στοιχείου του πίνακα με τρία
δεκαδικά. Το ίδιο να γίνει και για τα υπόλοιπα τρία στοιχεία
του πίνακα.
*/

#include <stdio.h>

int main()
{
    float pin[5];

    for (int i = 0; i < 5; i++)
    {
        printf("Δώσε μία τιμή:\t");
        scanf("%f", &pin[i]);
    }

    for (int i = 0; i < 5; i++)
    {
        printf("%.2f", pin[i]);
        for (int j = 0; j < 5; j++)
        {
            printf(" ");
        }
        printf("%.3f\n", pin[i]);
    }

    return 0;
}
