#include <stdio.h>

float sum(int);

int main()
{
    int ak;

    printf("Δώσε έναν ακέραιο:\n");
    scanf("%i", &ak);

    printf("Το άθροισμα των θετικών αριθμών που δώθηκαν είναι:\n%f\n", sum(ak));

    return 0;
}

float sum(int ak)
{
    float fl, sum = 0;
    for (int i = 0; i < ak; i++)
    {
        printf("Δώσε έναν αριθμό, %i από %i:\n", i+1, ak);
        scanf("%f", &fl);
        if (fl > 0)
        {
            sum += fl;
        }
    }
    return sum;
}