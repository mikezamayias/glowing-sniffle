#include <stdio.h>
#include <math.h>
#include <string.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)

int _strlen_(char *);
char *_strcpy_(char[], char[]);
char *_strcat_(char[], char[]);

int main(int argc, char const *argv[])
{

    char first_name[] = "Mike", last_name[] = "Zamayias";

    printf("%s\n", first_name);
    printf("%s\n", last_name);
    printf("%s\n", _strcat_(first_name, last_name));
    // printf("%s\n", strcat(first_name, last_name));

    return 0;
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

char *_strcpy_(char dest[ARRAY_SIZE], char src[ARRAY_SIZE])
{
    for (int i = 0; i <= _strlen_(src); i++)
    {
        dest[i] = src[i];
    }
    return dest;
}

char *_strcat_(char dest[ARRAY_SIZE], char src[ARRAY_SIZE])
{
    int dest_length = _strlen_(dest), src_length = _strlen_(src);
    for (int i = dest_length; i <= dest_length + src_length; i++)
    {
        dest[i] = src[i - dest_length];
    }
    return dest;
}