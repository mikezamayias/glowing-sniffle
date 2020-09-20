#include <stdio.h>
#include <math.h>
#include <string.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)

int _strlen_(char *);
char *_strchr_(char *, char);
char *_strstr_(char *, char *);

int main(int argc, char const *argv[])
{

    char s1[] = "My name is Mike", s2[] = "My";

    printf("%s\n", s1);
    printf("%s\n", s2);
    printf("%p\n", strstr(s1, s2));
    printf("%p\n", _strstr_(s1, s2));

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

char *_strstr_(char s1[], char s2[])
{
    int i, flag = 1, l_s2 = _strlen_(s2);
    char *ptrs[l_s2];

    for (i = 0; i < l_s2; i++)
    {
        ptrs[i] = _strchr_(s1, s2[i]);
    }

    for (i = 0; i < l_s2 - 1; i++)
    {
        if (ptrs[i] != ptrs[i + 1])
        {
            flag = 0;
        }
    }

    if (flag)
    {
        return ptrs[i];
    }
    else
    {
        return NULL;
    }
}