#include <stdio.h>

int main()
{
    float pr, tel, bm, erg, olikos;
    char ch;

    printf("Δώστε τους βαθμούς της προόδου και της εξεταστικής:\n");
    scanf("%f", &pr);
    scanf("%f", &tel);

    bm = 0.4 * pr + 0.6 * tel;

    printf("Έγινε εξέταση εργαστηρίου; (δώστε Ν για ναι)\n");
    scanf(" "); 
    ch = getchar();

    if (ch != 'N')
    {
        printf("Βαθμός θεωρίας:\n%5.1f\n", bm);
    }
    else
    {
        printf("Δώστε τον βαθμό του εργαστηρίου:\n");
        scanf("%f", &erg);
        olikos = 0.5 * (erg + bm);
        printf("Ολικός βαθμός μαθήματος:\n%5.1f\n", olikos);
    }

    return 0;
}
