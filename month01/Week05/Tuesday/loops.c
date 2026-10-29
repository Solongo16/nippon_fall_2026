#include <stdio.h>

//1
int count_divisors(int n)
{
 int c = 0;
 for (int d = 1; d <= n; d++)
 {if (n % d == 0 ) 
 {c = c + 1; } } 
 return c;
}

//2
int digit_sum(int n)
{
int s = 0; while (n > 0)
{
  s = s + n % 10;
  n = n / 10;
}
return s;
}

//3
int is_prime (int n)
{
  if (n < 2) {return 0;}
  int d = 2; while (d * d <= n)  
  {if (n % d == 0)
  {return 0;} d = d + 1;  // n-iig d-t huvaahad 0 garval false; 0 garahgui uyd d + 1
  } return 1; 
}

//4A
int power_loop(int b, int e)
{
  int r = 1;
  for (int i = 1; i <= e; i++)
  {r = r * b; } return r;
}

int power_rec(int b, int e)
{
  if (e == 0) {return 1;}
  else {return b * power_rec(b, e - 1);}
}

//void * gargana

void print_bar(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}

void print_triangle(int n) {
    for (int row = 1; row <= n; row++) {
        print_bar(row);
    }
}

void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

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
/* count_divisors : int -> int   (for, %) */
check_int(count_divisors(12), 6);
check_int(count_divisors(28), 6);
check_int(count_divisors(1), 1);

/* digit_sum : int -> int   (while, %, /) */
check_int(digit_sum(9075), 21);
check_int(digit_sum(7), 7);
check_int(digit_sum(0), 0);

/* is_prime : int -> int   (1 эсвэл 0; while d * d <= n) */
check_int(is_prime(1), 0);
check_int(is_prime(2), 1);
check_int(is_prime(21), 0);
check_int(is_prime(23), 1);

/* power_loop : int int -> int   b-ийн e зэрэг, for-оор
   power_rec  : int int -> int   ижил, recursion-оор (e == 0 бол 1) */
check_int(power_loop(2, 10), 1024);
check_int(power_loop(3, 0), 1);
check_int(power_rec(2, 10), 1024);
check_int(power_rec(5, 3), 125);

  print_bar(5);
  print_triangle(3);

return 0;
}


