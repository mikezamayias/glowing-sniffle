#include <stdio.h>

int main(int argc, char const *argv[])
{
    int row, column;

    for (column = 0; column < 11; column++)
    {
        if (column == 0)
        {
            printf("\t");
        }
        else
        {
            printf("%8i", column);
        }
    }
    printf("\n");
    printf("\n");
    for (row = 1; row < 11; row++)
    {
        printf("%i\t", row);
        for (column = 1; column < 11; column++)
        {
            printf("%8i", column * row);
        }
        printf("\n");
    }

    return 0;
}
