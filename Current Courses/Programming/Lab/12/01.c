#include <stdio.h>
#include <math.h>

int main(int argc, char const *argv[])
{
    printf("Οι δέκα πρώτες δυνάμεις του 10:\n");
    for (int i = 0; i < 9; i++)
    {
        printf("%.f\n", pow(10, i));
        // printf("%10.f\n", pow(10, i));
    }
    printf("\n");

    return 0;
}
