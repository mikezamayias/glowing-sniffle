#include <stdio.h>

int area(float *, float *, float *);

int main(int argc, char const *argv[])
{
    float bs, yps, emb;

    printf("bs =\t");
    scanf("%f", &bs);
    printf("yps =\t");
    scanf("%f", &yps);
    printf("emb =\t");
    scanf("%f", &emb);

    printf("area:\t%i\nbs:\t%f\nyps:\t%f\nemb:\t%f\n", area(&bs, &yps, &emb), bs, yps, emb);

    return 0;
}

int area(float *bs, float *yps, float *emb)
{
    float temp;

    while (1)
    {
        temp = *bs * *yps / 2;
        if ((temp > *emb) && (*bs > 0))
        {
            *bs -= 0.1;
        }
        else
        {
            break;
        }
    }

    *emb = temp;

    if (temp < *emb)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}