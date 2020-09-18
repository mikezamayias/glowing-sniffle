#include <stdio.h>

#define ARRAY_SIZE 10

int main()
{
    int ints[ARRAY_SIZE], min, max;

    min = max = 0;

    printf("Δώσε 10 ακεραίους.\n");
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("Ακέραιος %2i:\t", i+1);
        scanf("%i", &ints[i]);
        if (ints[i] > max)
        {
            max = ints[i];
        }
        if (ints[i] < min)
        {
            min = ints[i];
        }
    }
    printf("\n");

    printf("Μέγιστος:\t%i\n", max);
    printf("Ελάχιστος:\t%i\n", min);

    return 0;
}
