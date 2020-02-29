#include <stdio.h>
#include <stdlib.h>

#define Rows 4
#define Columns 5

int randomIntGenerator();

int main()
{
    int grades[Rows][Columns];
    int column, row;

    for (row = 0; row < Rows; row++)
    {
        for (column = 0; column < Columns; column++)
        {
            grades[row][column] = randomIntGenerator();
            printf("grades[%i][%i]) = %i\n", row, column, grades[row][column]);
        }
    }

    return 0;
}

int randomIntGenerator()
{
    return rand() % 11;
}
