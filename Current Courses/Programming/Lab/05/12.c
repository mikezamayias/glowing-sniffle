#include <stdio.h>

#define ARRAY_SIZE 10

int main()
{
    int pin[ARRAY_SIZE], mat[ARRAY_SIZE];

    printf("Δώσε 10 ακεραίους.\n");
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("Ακέραιος %2i:\t", i + 1);
        scanf("%i", &pin[i]);
        mat[9 - i] = pin[i];
    }
    printf("Ο πρώτος πίνακας:\n");
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%i\t", pin[i]);
    }
    printf("\n");
    printf("Ο δεύτερος πίνακας:\n");
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%i\t", mat[i]);
    }
    printf("\n");

    return 0;
}
