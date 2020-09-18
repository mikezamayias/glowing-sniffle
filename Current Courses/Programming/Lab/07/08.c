#include <stdio.h>

int main()
{
    for (int line = 0; line < 6; line++)
    {
        for (int character = 4; line <= character; character--)
        {
            printf("*");
        }
        printf("\n");
    }
    for (int line = 0; line < 6; line++)
    {
        for (int character = 1; character<=line; character++)
        {
            printf("*");
        }
        printf("\n");
    }
    return 0;
}
