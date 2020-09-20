#include <stdio.h>
#include <math.h>
#include <string.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)

int _strlen_(char *);
int _strcmp_(char *, char *);

int main(int argc, char const *argv[])
{

    char first_name[] = "a", last_name[] = "apple";

    printf("%s\n", first_name);
    printf("%s\n", last_name);
    printf("%i\n", strcmp(first_name, last_name));
    printf("%i\n", _strcmp_(first_name, last_name));
    // printf("%s\n", strcat(first_name, last_name));

    return 0;
}

int _strlen_(char s[])
{
    int character_counter = 0;
    for (int i = 0; s[i] != '\x0'; i++)
    {
        character_counter++;
    }
    return character_counter;
}

int _strcmp_(char s1[], char s2[])
{
    int diff, length_s1, length_s2, end;

    diff = 0;
    end = ARRAY_SIZE;
    length_s1 = _strlen_(s1);
    length_s2 = _strlen_(s2);

    if (length_s2 > length_s1)
    {
        end = length_s2;
    }
    else
    {
        end = length_s1;
    }

    for (int i = 0; i < end; i++)
    {
        diff = (int)s1[i] - (int)s2[i];
        if (diff)
        {
            return diff;
        }
    }

    return diff;
}
