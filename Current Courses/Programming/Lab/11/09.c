#include <stdio.h>
#include <math.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)

char *_strcpy_(char[], char[]);
int _strlen_(char *);

int main(int argc, char const *argv[])
{
    char first_name[] = "Mike", last_name[] = "Zamayias";

    printf("%s\n", first_name);
    printf("%s\n", last_name);
    printf("%s\n", _strcpy_(first_name, last_name));
    // printf("%s\n", strcpy(first_name, last_name));

    return 0;
}

char *_strcpy_(char dest[ARRAY_SIZE], char src[ARRAY_SIZE])
{

    for (int i = 0; i <= _strlen_(src); i++)
    {
        dest[i] = src[i];
    }
    return dest;
}

int _strlen_(char name[])
{
    int character_counter = 0;
    for (int i = 0; name[i] != '\x0'; i++)
    {
        character_counter++;
    }
    return character_counter;
}