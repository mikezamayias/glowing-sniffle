#include <stdio.h>

void printUnsignedRange(int bytes)
{
    int bits = 8 * bytes;

    unsigned long long to = (1LLU << (bits - 1)) + ((1LL << (bits - 1)) - 1);

    printf("0 to %llu\n", to);
}

void printSignedRange(int bytes)
{
    int bits = 8 * bytes;

    long long from = -(1LL << (bits - 1));
    long long to = (1LL << (bits - 1)) - 1;

    printf("%lld to %lld\n", from, to);
}

int main()
{
    printf("Range of char:\n");
    printSignedRange(sizeof(char));

    printf("Range of unsigned char:\n");
    printUnsignedRange(sizeof(unsigned char));

    printf("Range of short:\n");
    printSignedRange(sizeof(short));

    printf("Range of unsigned short:\n");
    printUnsignedRange(sizeof(unsigned short));

    printf("Range of int:\n");
    printSignedRange(sizeof(int));

    printf("Range of unsigned int:\n");
    printUnsignedRange(sizeof(unsigned int));

    printf("Range of long:\n");
    printSignedRange(sizeof(long));

    printf("Range of unsigned long:\n");
    printUnsignedRange(sizeof(unsigned long));

    printf("Range of long long:\n");
    printSignedRange(sizeof(long long));

    printf("Range of unsigned long long:\n");
    printUnsignedRange(sizeof(unsigned long long));

    return 0;
}
