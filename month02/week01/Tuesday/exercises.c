#include <stdio.h>
#include <stdbool.h>


double apply_discount(double price, double discount_percent)
{
    return price - (price * discount_percent);
}


//Ex02

int get_hours(int total_minutes)
{
    return total_minutes / 60;
}

//EX03

char to_upper_case(char c)
{
    return c - 32;
}


//Boolean

bool is_negative(int number) 
{
        return number < 0;
        
}

//EX05

bool is_positive_and_even(int number) 
{
        return number % 2 == 0 && number > 0;
        
}

//EX06
int round_down_to_ten(int n)
{
    return n / 10 * 10;
} 

//Ex07

bool at_least_two_positive(int a, int b, int c) 
{
     return ((a > 0) + (b > 0) + (c > 0)) >= 2;
        
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
    check_double(apply_discount(100.0, 0.15), 85.0);
    check_int(get_hours(135), 2);
    printf("Capital Letter = %c\n", to_upper_case('a')); //A
    printf("Negative = %s\n",
       is_negative(-1) ? "true" : "false");
    printf("Negative = %s\n",
       is_negative(10) ? "true" : "false");
    printf("positive_even = %s\n",
       is_positive_and_even(4) ? "true" : "false");
    printf("positive_even = %s\n",
       is_positive_and_even(-4) ? "true" : "false");
    printf("%d\n", round_down_to_ten(127));
    printf("at_least_two_positive= %d\n",
       at_least_two_positive(4, 4, 9));
    

     return 0;
} 

