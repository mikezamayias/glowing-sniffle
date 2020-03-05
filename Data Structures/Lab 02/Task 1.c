#include <stdio.h>
#include <stdlib.h>
#include <time.h>


#define Rows 4
#define Columns 5

int randomIntGenerator();
int better(int grades[][Columns]);
void print2dArray(int grades[][Columns]);
void populate2dArray(int grades[][Columns]);

int main()
{
    srand(time(NULL));

    int grades[Rows][Columns];
    int column, row, max;

    populate2dArray(grades);
    print2dArray(grades);

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
    int rows, columns;
    rows = columns = 0;
    int max = grades[rows][columns];

    for (rows; rows < Rows; rows++)
    {
        for (columns = 1; columns < Columns; columns++)
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

void populate2dArray(int grades[][Columns])
{
    for (int row = 0; row < Rows; row++)
    {
        for (int column = 0; column < Columns; column++)
        {
            grades[row][column] = randomIntGenerator();
        }
    }
}