#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAXIMUM_NUMBER +100
#define MINIMUM_NUMBER -100

void guess(int, int *, int *);

int main()
{
    srand(time(NULL));

    int num = rand() % (MAXIMUM_NUMBER + 1 - MINIMUM_NUMBER) + MINIMUM_NUMBER, meg, mik;

    meg = mik = 0;

    guess(num, &meg, &mik);

    printf("Τυχαίος αριθμός:\t\t%i\n", num);
    printf("Πλήθος χαμηλών προσπαθειών:\t%i\n", mik);
    printf("Πλήθος υψηλών προσπαθειών:\t%i\n", meg);

    return 0;
}

void guess(int num, int *meg, int *mik)
{
    int gs;

    printf("Δώσε έναν ακέραιο από το %i έως το %i:\n", MINIMUM_NUMBER, MAXIMUM_NUMBER);
    do
    {
        scanf("%i", &gs);
        if (gs == num)
        {
            break;
        }
        else
        {
            if (gs > num)
            {
                printf("Δώσε μικρότερο αριθμο:\n");
                *meg = *meg + 1;
            }
            else
            {
                printf("Δώσε μεγαλύτερο αριθμο:\n");
                *mik = *mik + 1;
            }
        }
    } while (gs != num);
}