#include <stdio.h>
#include <math.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 10)

int _strlen_(char *);

int main(int argc, char const *argv[])
{
    char name[ARRAY_SIZE];

    printf("Enter your name:\t");
    scanf("%[^\n]%*c", name);
    
    printf("Your name is %i character long.\n", _strlen_(name));

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