#include <stdio.h>

int square(int x)  {
    return x * x;
}

int main(void) {
    printf("%d\n", square(7));
    printf("%d\n", square(-3));
    return 0;
}