#include <stdio.h>

int seconds(int, int, int);

int main()
{
    int hs, ms, ss;

    printf("Δώσε ώρες:\n");
    scanf("%i", &hs);
    printf("Δώσε λεπτά:\n");
    scanf("%i", &ms);
    printf("Δώσε δευετερόλεπτα:\n");
    scanf("%i", &ss);

    printf("Οι %2i ώρες, %2i λεπτά και %2i δευτερόλεπτα είναι %i δευτερόλεπτα.\n", hs, ms, ss, seconds(hs, ms, ss));

    return 0;
}

int seconds(int hs, int ms, int ss)
{
    return hs * 60 * 60 + ms * 60 + ss;
}
