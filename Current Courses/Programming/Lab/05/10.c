#include <stdio.h>
#include <math.h>

#define ARRAY_SIZE 10

int main()
{
    // float floats[] = {1.1, 2., 3.4, 6., 4.3, 2.9, 1., 2.1, 9., 6.5}, ave, sqr_ave, std;
    float floats[ARRAY_SIZE], ave, sqr_ave, std;
    ave = sqr_ave = .0;

    printf("Δώσε 10 αριθμούς:\n");
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        scanf("%f", &floats[i]);
        ave += floats[i];
        sqr_ave += pow(floats[i], 2);
    }

    ave /= ARRAY_SIZE;
    sqr_ave /= ARRAY_SIZE;

    std = sqrt(sqr_ave - pow(ave, 2));

    printf("Τυπική απόκλιση:\n%.1f\n", std);

    return 0;
}
