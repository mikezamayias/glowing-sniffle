#include <stdio.h>

int fibonacci(int);

int main()
{
    int n;

    printf("Δώσε έναν ακέραιο:\t");
    scanf("%i", &n);

    printf("Ο %iος αριθμός της σειράς Fibonacci:\n", n);
    printf("%i\n", fibonacci(n - 1));

    return 0;
}

int fibonacci(int n)
{
    if (n == 0)
    {
        return 0;
    }
    else if (n == 1)
    {
        return 1;
    }
    else
    {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
