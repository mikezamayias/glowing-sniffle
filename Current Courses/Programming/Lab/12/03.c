#include <stdio.h>
#include <math.h>

int main(int argc, char const *argv[])
{
    int number;
    float meme;

    printf("Δώσε έναν ακέραιο:\n");
    scanf("%i", &number);

    for (int i = 0; i < number; i++)
    {
        printf("Δώσε έναν αριθμό:\n");
        scanf("%f", &meme);

        printf("Το απόλυτο του %f:\n%f\n", meme, fabs(meme));
    }

    return 0;
}
