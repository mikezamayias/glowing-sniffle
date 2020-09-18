#include <stdio.h>

int main()
{
    float mis, en, ex, fp;

    printf("Δώσε τον μισθό του υπαλλήλου:\t");
    scanf("%f", &mis);
    printf("Δώσε το ενοίκιο του υπαλλήλου:\t");
    scanf("%f", &en);
    printf("Δώσε τα έξοδα του υπαλλήλου:\t");
    scanf("%f", &ex);

    fp = 14 * mis - 12 * (en + ex);
    if (fp < 0)
    {
        fp = 0;
    }

    if (fp < 1000 && 30000 < fp)
    {
        if (fp == 0)
        {
            printf("Ανειλικρινής δήλωση.\n");
            fp = 7 * mis;
        }
        else
        {
            printf("Ακραίο εισόδημα.\n");
        }
    }
    else
    {
        if (fp < 10000)
        {
            fp *= .1;
        }
        else if (fp < 20000)
        {
            fp -= 10000;
            fp *= 1.5;
            fp += 10000 * .1;
        }
        else if (20000 < fp)
        {
            fp -= 10000 + 20000;
            fp *= 0.2;
            fp += 10000 * .1;
            fp += 10000 * .15;
        }
    }

    printf("Ο φόρος του υπαλλήλου είναι:\t%10.2f\n", fp);

    return 0;
}
