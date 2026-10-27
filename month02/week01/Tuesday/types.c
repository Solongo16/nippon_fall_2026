#include <stdio.h>
#include <stdbool.h>

int main(void)
{
    int age = 19;
    double height = 1.72;
    char grade = 'B';
    bool passed = true;


printf("age     = %d\n", age);
printf("height  = %.2f\n", height);
printf("grade   = %c\n", grade);
printf("passed  = %d\n", passed);


printf("sizeof(char)    = %zu\n", sizeof(char));
printf("sizeof(int)     = %zu\n", sizeof(int));
printf("sizeof(long)    = %zu\n", sizeof(long));
printf("sizeof(double)  = %zu\n", sizeof(double));
printf("sizeof(bool)    = %zu\n", sizeof(bool));


printf("'A' as number   = %d\n", 'A');
printf("'A' +  1        = %c\n", 'A' + 1);
printf("'7' - '0'       = %d\n", '7' - '0');

return 0;

}