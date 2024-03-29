/*
Να γραφεί ένα πογραμμα που θα κάνει τα εξής:
-   Θα δέχεται δύο ακέραιες μεταβηλτές, τις nik και nak, με τιμές 3 και 5 αντίστοιχα.
-   Να υπολογίσετε το άθροισμα των μεταβλητών (που θα πείτε atr) και το γινόμενό τους
    (που θα πείτε gin).
-   Να γράφεται στην οθόνη η λέξη VALUES και από κάτω 5 αστεράκια. Στην από κάτω
    γραμμή θα γράφεται η τιμή της nik, και στην πιο κάτω η τιμή της nak.
-   Θα αφήσετε τρεις κενές γραμμές στην οθόνη και από κάτω θα γράφει:
    Άθροισμα = xxxxxx Γινόμενο = xxxxxx
Στη θέση των xxxxxx θα γραφεί η τιμή του αθροίσματος και του γινομένου.
*/

#include <stdio.h>

int main()
{
    int nik, nak, atr, gin;

    nik = 3;
    nak = 5;
    atr = nik + nak;
    gin = nik * nak;

    printf("%s\n", "VALUES");
    for (int i = 0; i < nak; i++)
        printf("*");
    for (int i = 0; i < nik + 1; i++)
        printf("\n");

    printf("nik = %i\nnak = %i\n", nik, nak);
    printf("Άθροισμα = %5i Γινόμενο = %5i\n", atr, gin);

    return 0;
}
