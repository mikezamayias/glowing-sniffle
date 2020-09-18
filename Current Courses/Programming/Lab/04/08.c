#include <stdio.h>
#include <math.h>

int main()
{
    float a, b, c, d, r1, r2, rr, rj;

    printf("Η εξίσωση είναι:\tα*x^2 + β*x + γ = 0\n");
    printf("Δώσε την τιμή του α:\t");
    scanf("%f", &a);
    printf("Δώσε την τιμή του β:\t");
    scanf("%f", &b);
    printf("Δώσε την τιμή του γ:\t");
    scanf("%f", &c);

    printf("\n");
    if (a == 0 && b == 0)
    {
        printf("Δεν υπάρχει εξίσωση.\n");
    }
    else
    {
        if (a == 0 && b != 0)
        {
            printf("Μία πραγματική ρίζα:\n\t\t\t%.1f\n", -c / b);
        }
        if (a != 0 && b != 0)
        {
            if (c == 0)
            {
                r1 = 0.0;
                r2 = -b / a;
                printf("Δύο πραγματικές ρίζες:\t%.1f\n\t\t\t%.1f\n", r1, r2);
            }
            else
            {
                d = pow(b, 2) - 4 * a * c;
                if (d > 0)
                {
                    r1 = (-b - sqrt(d)) / (2 * a);
                    r2 = (-b + sqrt(d)) / (2 * a);
                    printf("Δύο πραγματικές ρίζες:\t%.1f\n\t\t\t%.1f\n", r1, r2);
                }
                else
                {
                    rr = -b / (2 * a);
                    rj = sqrt(-d) / (2 * a);
                    printf("Δύο μιγαδικές ρίζες:\t%.1f + %.3fj\n\t\t\t%.1f - %.3fj\n", rr, rj, rr, rj);
                }
            }
        }
    }

    return 0;
}
