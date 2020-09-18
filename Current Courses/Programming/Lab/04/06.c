#include <stdio.h>
#include <math.h>

int main()
{
    int a, b, c;

    printf("Δώσε τα μήκη των πλευρών ενος τριγώνου:\n");
    printf("α = ");
    scanf("%i", &a);
    printf("β = ");
    scanf("%i", &b);
    printf("γ = ");
    scanf("%i", &c);

    if (pow(a, 2) == pow(b, 2) + pow(c, 2))
    {
        printf("Ορθογώνιο τρίγωνο, οι πλευρές β και γ είναι κάθετες.\n");
    }
    else if (pow(b, 2) == pow(a, 2) + pow(c, 2))
    {
        printf("Ορθογώνιο τρίγωνο, οι πλευρές α και γ είναι κάθετες.\n");
    }
    else if (pow(c, 2) == pow(b, 2) + pow(a, 2))
    {
        printf("Ορθογώνιο τρίγωνο, οι πλευρές α και β είναι κάθετες.\n");
    }
    else
    {
        printf("Όχι ορθογώνιο τρίγωνο.\n");
    }


    return 0;
}
