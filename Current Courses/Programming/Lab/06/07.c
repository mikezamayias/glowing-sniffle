#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAXIMUM_NUMBER 100
#define MINIMUM_NUMBER 0

int main()
{
    srand(time(NULL));

    int num = rand() % (MAXIMUM_NUMBER + 1 - MINIMUM_NUMBER) + MINIMUM_NUMBER, gs, cnt = 0;

    printf("Δώσε έναν ακέραιο από το 0 έως το 100:\n");
    do
    {
        cnt++;
        scanf("%i", &gs);
        printf("\n");
        if (gs == num)
        {
            break;
        }
        else
        {
            if (gs > num)
            {
                printf("Δώσε μικρότερο αριθμο:\n");
            }
            else
            {
                printf("Δώσε μεγαλύτερο αριθμο:\n");
            }
        }
    } while (gs != num);

    printf("\nΤυχαίος αριθμός:\n%i\nΠλήθος προσπαθειών:\n%i\n", num, cnt);

    return 0;
}
