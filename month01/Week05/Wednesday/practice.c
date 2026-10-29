#include <stdio.h>
#include<stdbool.h>

int count_digits(int number)
{
  int c = 1;
  while (number >= 10)
  {number = number / 10;
  c = c + 1;} 
  return c;
}

//gcd
int gcd(int a, int b)
{
  while (b != 0) {
    int r = a % b;
    a = b;  // b a-ruu utgaa ogno
    b = r;  // r  b-ruu utgaa ogno
  }
  return a;
}

/* is_perfect : int -> int   өөрөөсөө бусад хуваагчийн нийлбэр = n бол 1 */
int is_perfect(int n)
{
  int s = 0;
  for (int d = 1; d < n; d++)
  {if (n % d == 0)
  {s = s + d;}
  } return s == n;
}

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

int main(void){
  /* count_digits : int -> int   (0-ийн цифрийн тоо 1) */
check_int(count_digits(90210), 5);
check_int(count_digits(7), 1);
check_int(count_digits(0), 1);

/* gcd : int int -> int   Евклид, mod хувилбар (L7) */
check_int(gcd(48, 18), 6);
check_int(gcd(84, 36), 12);
check_int(gcd(7, 5), 1);

/* is_perfect : int -> int   өөрөөсөө бусад хуваагчийн нийлбэр = n бол 1 */
check_int(is_perfect(6), 1);
check_int(is_perfect(28), 1);
check_int(is_perfect(12), 0);
}
