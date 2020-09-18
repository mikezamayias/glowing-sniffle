#include <stdio.h>

int main()
{
    float the;
    printf("Δώσε θερμοκρασία:\t");
    scanf("%f", &the);
    if (the < -30 && the > 50)
    {
        printf("Λάθος");
    }
    else
    {
        if (40 <= the && the <= 50)
        {
            printf("Πολλή ζέστη");
        }
        else if (10 < the && the < 40)
        {
            printf("Καλός καιρός");
        }
        else
        {
            printf("Κρύο");
        }
    }
    printf("\n");
    return 0;
}
