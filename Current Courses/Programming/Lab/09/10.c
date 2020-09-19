#include <stdio.h>
#include <math.h>

float stddev(float, int *);

int main(int argc, char const *argv[])
{
    float fp, std;
    int counter;

    printf("Δώσε έναν αριθμό:\t");
    scanf("%f", &fp);

    std = stddev(fp, &counter);

    printf("%f\n%i\n", std, counter);

    return 0;
}

float stddev(float fp, int *counter)
{
    float number, average, squares_average, standard_deviation;

    average = squares_average = 0;

    for (*counter = 0; number < fp; *counter = *counter + 1)
    {
        printf("Δώσε έναν αριθμό:\t");
        scanf("%f", &number);
        average += number;
        squares_average += pow(number, 2);
    }

    average /= *counter;
    squares_average /= *counter;
    standard_deviation = sqrt(squares_average - pow(average, 2));

    return standard_deviation;
}