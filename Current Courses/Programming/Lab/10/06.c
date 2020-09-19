#include <stdio.h>

#define N 3

int *comp(int *, int *);

int main(int argc, char const *argv[])
{
    int pin[N], mat[N], *ptr;

    printf("Δώσε ακέραιες αριθμούς σε 2 πίνακες %i στοιχείων.\n", N);

    printf("Για τον πρώτο πίνακα, δώσε ακέραιο αριθμό\n");
    for (int i = 0; i < N; i++)
    {
        printf("για το %iο στοιχείο:\t", i + 1);
        scanf("%i", &pin[i]);
    }

    printf("Για τον δεύτερο πίνακα, δώσε ακέραιο αριθμό\n");
    for (int i = 0; i < N; i++)
    {
        printf("για το %iο στοιχείο:\t", i + 1);
        scanf("%i", &mat[i]);
    }

    ptr = comp(pin, mat);

    printf("Η τιμή του δείκτη:\t\t%p\nΤα περιεχόμενα του δείκτη:\t%i\n", ptr, *ptr);

    return 0;
}

int *comp(int *pin, int *mat)
{
    int d = 0;

    for (int i = 0; i < N; i++)
    {
        if (pin[i] != mat[i])
        {
            mat[i] = 0;
            if (d == 0)
            {
                d = i;
            }
        }
    }


    if (d == 0)
    {
        return mat;
    }
    else
    {
        return pin + d;
    }
}