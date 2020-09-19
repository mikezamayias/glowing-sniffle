#include <stdio.h>

int population(char);

int main()
{
    char ch;

    printf("Δώσε έναν χαρακτήρα:\t");
    scanf("%[^\n]%*c", &ch);

    printf("Πλήθος αστοχιών:\t%i\n", population(ch));

    return 0;
}

int population(char ch)
{
    int counter;
    char xar;

    for (counter = 0; ch != xar; counter++)
    {
        printf("%i\tΔώσε έναν άλλο χαρακτήρα:\t", counter);
        // scanf("%[^\n]%*c", &xar);
    }

    return counter;
}
