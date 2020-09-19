#include <stdio.h>
#include <math.h>
#include <string.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)
// #define ARRAY_SIZE 10

char *reverse(char *);

int main(int argc, char const *argv[])
{
    char wrd[ARRAY_SIZE], *ptr;

    printf("Δώσε μία συμβολοσειρά:\n");
    scanf("%[^\n]%*c", wrd);

    printf("Η συμβολοσειρά που δώθηκε:\n%s\n", wrd);
    ptr = reverse(wrd);
    printf("Η συμβολοσειρά που δώθηκε, ανεστραμμένη:\n%s\nΗ τιμή του δείκτη:\n%p\n", wrd, ptr);

    return 0;
}

char *reverse(char wrd[ARRAY_SIZE])
{
    char reversed[ARRAY_SIZE];
    int end = strlen(wrd);
    for (int i = 0; i < end; i++)
    {
        reversed[i] = wrd[end - (i + 1)];
    }
    for (int i = 0; i < end; i++)
    {
        wrd[i] = reversed[i];
    }
    return wrd;
}