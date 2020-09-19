#include <stdio.h>
#include <math.h>

float std(int);

int main()
{
    int ak;

    printf("Δώσε έναν ακέραιο:\n");
    scanf("%i", &ak);

    printf("Η τυπική απόκλιση των παραπάνω αριθμών ισούται με:\n%f\n", std(ak));

    return 0;
}

float std(int ak)
{
    float number, average, squares_average, standard_deviation;

    average = squares_average = 0;

    for (int i = 0; i < ak; i++)
    {
        printf("Δώσε έναν αριθμό, %i από %i:\n", i + 1, ak);
        scanf("%f", &number);
        average += number;
        squares_average += pow(number, 2);
    }

    average /= ak;
    squares_average /= ak;
    standard_deviation = sqrt(squares_average - pow(average, 2));

    return standard_deviation;
}