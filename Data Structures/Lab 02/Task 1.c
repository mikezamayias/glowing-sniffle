#include <stdio.h>
#include <stdlib.h>

#define Rows 4
#define Columns 5

int randomIntGenerator();
int better(int grades[][Columns]);
void print2dArray(int grades[][Columns]);

int main()
{
    int grades[Rows][Columns];
    int column, row, max;

    //  populate grades array with random ints from 0 to 10
    for (row = 0; row < Rows; row++)
    {
        for (column = 0; column < Columns; column++)
        {
            grades[row][column] = randomIntGenerator();
        }
    }

    max = better(grades);
    printf("grades max:\t%i\n", max);

    return 0;
}

int randomIntGenerator()
{
    return rand() % 11; //  11 as it's a unit more than 10
}

int better(int grades[][Columns])
{
    int rows, columns, max = grades[rows][columns];
    rows = columns = 0;

    for (columns = 1; columns < Columns; columns++)
    {
        for (rows; rows < Rows; rows++)
        {
            if (grades[rows][columns] > max)
            {
                max = grades[rows][columns];
            }
        }
    }

    return max;
}

void print2dArray(int grades[][Columns])
{
    for (int row = 0; row < Rows; row++)
    {
        for (int column = 0; column < Columns; column++)
        {
            printf("grades[%i][%i]) = %i\n", row, column, grades[row][column]);
        }
    }
}