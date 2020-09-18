#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAXIMUM_NUMBER +100
#define MINIMUM_NUMBER -100
#define ARRAY_SIZE 10

int main()
{
    srand(time(NULL));

    int mat[ARRAY_SIZE], i, sum = 0, counter = 0;

    for (i = 0; i < ARRAY_SIZE; i++)
    {
        mat[i] = rand() % (MAXIMUM_NUMBER + 1 - MINIMUM_NUMBER) + MINIMUM_NUMBER;
        sum += mat[i];
        if (mat[i] > 0)
        {
            counter++;
        }
    }

    printf("%i ακέραιοι, από το %i έως το %i:\n", ARRAY_SIZE, MINIMUM_NUMBER, MAXIMUM_NUMBER);
    
    for (i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%i\t", mat[i]);
    }
    printf("\n");
    printf("Το άθροισμά των παραπάνω ακεραίων:\n%i\n", sum);
    printf("Το πλήθος των θετικών ακεραίων:\n%i\n", counter);

    return 0;
}