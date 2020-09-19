#include <stdio.h>

float one(int);
float two(int);

int main()
{
    int ak;

    printf("Δώσε έναν ακέραιο:\n");
    scanf("%i", &ak);

    printf("Το άθροισμα ένα ισούται με:\n%f\n", one(ak));
    printf("Το άθροισμα δύο ισούται με:\n%f\n", two(ak));

    return 0;
}

float one(int ak)
{
    float sum = 0;
    for (int i = 1; i <= ak; i++)
    {
        sum += 1 / i;
    }
    return sum;
}

float two(int ak)
{
    float sum = 0;
    for (int i = 1; i <= ak; i++)
    {
        if (i % 2 == 0)
        {
            sum -= 1.0 / i;
        }
        else
        {
            sum += 1.0 / i;
        }
    }
    return sum;
}