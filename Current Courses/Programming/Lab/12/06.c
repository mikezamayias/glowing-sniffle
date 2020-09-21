#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 3)

typedef struct complex
{
    float real, imaginary;
} complex;

int main(int argc, char const *argv[])
{
    char operation;
    float a, b, c, d;
    complex z1, z2, z;

    printf("Δώσε το πραγματικό μέρος ενός μιγαδικού:\n");
    scanf("%f", &z1.real);
    printf("Δώσε το μιγαδικό μέρος ενός μιγαδικού:\n");
    scanf("%f", &z1.imaginary);

    printf("Δώσε το πραγματικό μέρος ενός άλλου μιγαδικού:\n");
    scanf("%f", &z2.real);
    printf("Δώσε το μιγαδικό μέρος ενός άλλος μιγαδικού:\n");
    scanf("%f", &z2.imaginary);

    a = z1.real;
    b = z1.imaginary;
    c = z2.real;
    d = z2.imaginary;

    do
    {
        printf("Δώσε την πράξη (+, -, *, /):\n");
        scanf(" ");
        scanf("%c", &operation);
        // scanf("%[^\n]%*c", &operation);

        switch (operation)
        {
        case '+':
            z.real = a + c;
            z.imaginary = b + d;
            break;
        case '-':
            z.real = a - c;
            z.imaginary = b - d;
            break;
        case '*':
            z.real = (a * c) - (b * d);
            z.imaginary = (b * c) + (a * d);
            break;
        case '/':
            z.real = ((a * c) + (b * d)) / (pow(c, 2) + pow(d, 2));
            z.imaginary = ((b * c) - (a * d)) / (pow(c, 2) + pow(d, 2));
            break;
        default:
            printf("Λάθος\n");
            break;
        }
    } while (operation != '+' && operation != '-' && operation != '*' && operation != '/');

    printf("Το αποτέλεσμα της πράξης είναι:\n%f+j(%f)\n", z.real, z.imaginary);

    return 0;
}
