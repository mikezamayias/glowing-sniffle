#include <stdio.h>
#include <math.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)

int _strlen_(char *);
char *_strchr_(char *, char);

int main(int argc, char const *argv[])
{

    char s[] = "apple", ch = 'a';

    printf("%s\n", s);
    printf("%c\n", ch);
    printf("%p\n", _strchr_(s, ch));
    // printf("%p\n", strchr(s, ch));

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

char *_strchr_(char s[], char ch)
{
    int end;

    end = _strlen_(s);

    for (int i = 0; i < end; i++)
    {
        if (s[i] == ch)
        {
            return &s[i];
        }
    }

    return NULL;
}