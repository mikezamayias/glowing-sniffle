#include <stdio.h>

int sum(int);

int main()
{
    int ak;

    printf("Δώσε έναν ακέραιο, μεγαλύτερο της μονάδας:\n");
    scanf("%i", &ak);

    printf("Το άθροισμα των ακεραίων, από το 1 έως το %i είναι:\n%i\n", ak, sum(ak));

    return 0;
}

int sum(int ak)
{
    int sum = 0;
    for (int i = 1; i <= ak; i++)
    {
        sum += i;
    }
    return sum;
}