#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define DimensionSize 3

int randomIntGenerator();
void populate2dArray(int pinax[DimensionSize][DimensionSize]);
void print2dArray(int pinax[DimensionSize][DimensionSize]);
int checkSquareness(int pinax[DimensionSize][DimensionSize]);
int checkSparsity(int pinax[DimensionSize][DimensionSize]);
int checkTriangularity(int pinax[DimensionSize][DimensionSize]);
int checkSymmetry(int pinax[DimensionSize][DimensionSize]);

int main()
{
    srand(time(NULL));

    int pinax[DimensionSize][DimensionSize];

    populate2dArray(pinax);
    print2dArray(pinax);

    if (checkSquareness(pinax))
    {
        printf("Array is square.\n");
    }
    else
    {
        printf("Array is not square.\n");
    }

    if (checkSparsity(pinax))
    {
        printf("Array is sparse.\n");
    }
    else
    {
        printf("Array is not sparse.\n");
    }

    if (checkTriangularity(pinax) == 0)
    {
        printf("Array is not triangular.\n");
    }
    else
    {
        if (checkTriangularity(pinax) == 1)
        {
            printf("Array is upper triangular.\n");
        }
        else
        {
            printf("Array is lower triangular.\n");
        }
    }

    return 0;
}

int randomIntGenerator()
{
    int M, N;
    M = N = 0;
    return M + rand() / (RAND_MAX / (N - M + 1) + 1);
}

void populate2dArray(int pinax[DimensionSize][DimensionSize])
{
    for (int row = 0; row < DimensionSize; row++)
    {
        for (int column = 0; column < DimensionSize; column++)
        {
            pinax[row][column] = randomIntGenerator();
        }
    }
}

void print2dArray(int pinax[DimensionSize][DimensionSize])
{
    for (int row = 0; row < DimensionSize; row++)
    {
        for (int column = 0; column < DimensionSize; column++)
        {
            printf("pinax[%i][%i] = %i\n", row, column, pinax[row][column]);
        }
    }
}

int checkSquareness(int pinax[DimensionSize][DimensionSize])
{
    if (DimensionSize == DimensionSize)
    {
        return 1;
    }
    return 0;
}

int checkSparsity(int pinax[DimensionSize][DimensionSize])
{
    int sparsitySum = 0, row, column;

    for (row = 0; row < DimensionSize; row++)
    {
        for (column = 0; column < DimensionSize; column++)
        {
            if (pinax[row][column] == 0)
            {
                sparsitySum++;
            }
        }
    }

    if (sparsitySum * 100 > DimensionSize * DimensionSize * 50)
    {
        return 1;
    }

    return 0;
}

int checkTriangularity(int pinax[DimensionSize][DimensionSize])
{
    int row, column;
    int aboveMDElementCounter, belowMDElementCounter;
    aboveMDElementCounter = belowMDElementCounter = 0;
    int aboveMDZeroCounter, belowMDZeroCounter;
    aboveMDZeroCounter = belowMDZeroCounter = 0;

    for (row = 0; row < DimensionSize; row++)
    {
        for (column = 0; column < DimensionSize; column++)
        {
            if (column > row) //  Check above main diagonal
            {
                aboveMDElementCounter++;
                if (pinax[row][column] == 0)
                {
                    aboveMDZeroCounter++;
                }
            }
            if (row > column) //  Check below main diagonal
            {
                belowMDElementCounter++;
                if (pinax[row][column] == 0)
                {
                    aboveMDZeroCounter++;
                }
            }
        }
    }
    if (aboveMDElementCounter == aboveMDZeroCounter)
    {
        return -1;
    }
    if (belowMDElementCounter == belowMDZeroCounter)
    {
        return 1;
    }
    return 0;
}

int checkSymmetry(int pinax[DimensionSize][DimensionSize])
{
    return 0;
}
