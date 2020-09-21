#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ARRAY_SIZE (int)pow(2, 3) * (int)pow(2, 3)

int main(int argc, char const *argv[])
{
    char s1[ARRAY_SIZE], s2[ARRAY_SIZE];
    // int i1, i2;
    // float f1, f2;
    // long l1, l2;

    printf("Δώσε δύο int:\n");
    scanf("%[^\n]%*c", s1);
    scanf("%[^\n]%*c", s2);
    printf("Το άθροισμα των int:\n%i\n", atoi(s1) + atoi(s2));
    
    printf("Δώσε δύο float:\n");
    scanf("%[^\n]%*c", s1);
    scanf("%[^\n]%*c", s2);
    printf("Το άθροισμα των ακεραίων:\n%f\n", atof(s1) + atof(s2));
    
    printf("Δώσε δύο long:\n");
    scanf("%[^\n]%*c", s1);
    scanf("%[^\n]%*c", s2);
    printf("Το άθροισμα των long:\n%li\n", atol(s1) + atol(s2));

    return 0;
}
