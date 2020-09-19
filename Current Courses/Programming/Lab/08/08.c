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

    // how many seconds in 4 hours, 3 minutes, 51 seconds
    // 14631 seconds

    printf("Οι %2i ώρες, %2i λεπτά και %2i δευτερόλεπτα είναι %i δευτερόλεπτα.\n", hs, ms, ss, seconds(hs, ms, ss));

    return 0;
}

int seconds(int hs, int ms, int ss)
{
    // int seconds;
    // seconds = ss;
    // seconds += 60 * ms;
    // seconds += 60 * 60 * hs;
    // return seconds;
    return hs * 60 * 60 + ms * 60 + ss;
}
