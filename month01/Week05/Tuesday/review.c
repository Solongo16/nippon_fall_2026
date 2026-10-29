#include <stdio.h>
#include <stdbool.h>

int square_sum(int a, int b)
{
 return a * a + b * b;
}

int tens_digit(int n)
{
 return (n / 10) % 10;
}

double average2(double a, double b)
{
 return (a + b) / 2;
}




/* check_int : бүхэл тоо тэнцүү бол PASS (C-ийн check-expect) */
void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

/* check_double : зөрүү 0.001-ээс бага бол PASS (L8: double яг биш) */
void check_double(double actual, double expected) 
{
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    } 
    
}

int main(void)
{   
  /* square_sum : int int -> int
   a² + b² */
check_int(square_sum(3, 4), 25);
check_int(square_sum(0, 5), 25);
check_int(square_sum(-2, 1), 5);

/* tens_digit : int -> int
   эерэг тооны аравтын орны цифр: / ба % ашигла */
check_int(tens_digit(1234), 3);
check_int(tens_digit(57), 5);
check_int(tens_digit(7), 0);

/* average2 : int int -> double
   хоёр бүхэл тооны дундаж (бутархайг алдахгүй!) */
check_double(average2(7, 8), 7.5);
check_double(average2(60, 60), 60.0);
   return 0;
} 


