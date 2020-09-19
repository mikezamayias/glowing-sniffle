#include <stdio.h>

void plot(int, int, char, char);

int main()
{
    int row, col;
    char ch, xar;

    printf("Δώσε αριθμό γραμμών:\t");
    scanf("%i", &row);
    printf("Δώσε αριθμό στηλών:\t");
    scanf("%i", &col);
    printf("Δώσε έναν χαρακτήρα:\t");
    scanf(" ");
    scanf("%c", &ch);
    printf("Δώσε έναν χαρακτήρα:\t");
    scanf(" ");
    scanf("%c", &xar);

    plot(row, col, ch, xar);

    return 0;
}

void plot(int row, int col, char ch, char xar)
{
    int rows = 0, cols;
    while (rows < row)
    {
        for (cols = 0; cols < col; cols++)
        {
            printf("%c", ch);
        }
        rows++;
        printf("\n");
        if (rows >= row)
        {
            break;
        }
        for (cols = 0; cols < col; cols++)
        {
            printf("%c", xar);
        }
        rows++;
        printf("\n");
        if (rows >= row)
        {
            break;
        }
    }
}
