#include <stdio.h>

#define ARRAY_SIZE 20

int main()
{
    int decimal_number, binary_array[ARRAY_SIZE], temporary_array[ARRAY_SIZE], i, temporary_number;

    do
    {
        printf("Δώσε έναν θετικό ακέραιο αριθμό:\t");
        scanf("%i", &decimal_number);
    } while (decimal_number <= 0);

    temporary_number = decimal_number;

    for (i = 0; decimal_number != 0; i++)
    {
        temporary_array[i] = decimal_number % 2;
        decimal_number /= 2;
    }

    printf("Ο αριθμός %8i στο δυαδικό είναι:\t", temporary_number);

    temporary_number = i;

    for (i = 0; i < temporary_number; i++)
    {
        binary_array[i] = temporary_array[temporary_number - 1 - i];
        printf("%i", binary_array[i]);
    }
    printf("\n");

    return 0;
}
