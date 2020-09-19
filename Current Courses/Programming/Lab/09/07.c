#include <stdio.h>

float kostos(int);

int main()
{
    int kwh;
    float k;

    printf("Δώσε την κατανάλωση ρεύματος σε κιλοβατώρες:\n");
    scanf("%i", &kwh);

    k = kostos(kwh);

    if (k > 100)
    {
        printf("Λογαριασμός:\n%.2f\n", k);
        printf("Πρόστιμο:\n%.2f\n", k - 100);
    }
    else
    {
        printf("Λογαριασμός:\n%.2f\n", k);
    }

    return 0;
}

float kostos(int kwh)
{
    float k;

    if (kwh < 100)
    {
        k = kwh * 0.1;
    }
    else if ((100 <= kwh) && (kwh < 200))
    {
        k = (kwh - 100) * 0.15 + 100 * 0.1;
    }
    else
    {
        k = (kwh - 200) * 0.2 + 100 * (0.1 + 0.15);
    }
    
    if (k > 100)
    {
        k += (k - 100) * 0.1;
    }
    
    return k;
}
