#include <stdio.h>

int main()
{
    int gwn;

    printf("Δώσε μία γωνία, σε μοίρες:\t");
    scanf("%i", &gwn);

    gwn %= 360;

    if (gwn == 90)
    {
        printf("Ορθή γωνία.\n");
    }
    else
    {
        if (gwn < 90)
        {
            printf("Οξεία γωνία.\n");
        }
        else
        {
            printf("Αμβλεία γωνία.\n");
        }
    }

    return 0;
}
