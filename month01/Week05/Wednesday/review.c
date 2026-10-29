#include <stdio.h>
#include <stdbool.h>

int count_multiples(int a, int b)
{
 return a / b;
}


int reverse_number(int n)
{
  int reversed = 0;
 while (n > 0)
 {
  int digit = n % 10;
  reversed = reversed * 10 + digit;
  n = n / 10;

 }
  return reversed;
}

int max3(int a, int b, int c)
{
  if (a >= b && a >= c)
  {return a;}
  else if (b >= a && b >= c)
  {return b;}
  else {return c;}
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

  /* count_multiples : int int -> int
   1..n дотор k-д хуваагдах тооны тоо */
   check_int(count_multiples(10, 3), 3);
   check_int(count_multiples(12, 4), 3);
   check_int(count_multiples(5, 7), 0);

   check_int(reverse_number(1234), 4321);
   check_int(reverse_number(120), 21);
   check_int(reverse_number(7), 7);

   /* max3 : int int int -> int   (if) */
   check_int(max3(1, 5, 3), 5);
   check_int(max3(9, 2, 9), 9);
   check_int(max3(-1, -5, -3), -1);
   return 0;
} 


