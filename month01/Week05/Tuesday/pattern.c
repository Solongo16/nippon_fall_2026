#include <stdio.h>

void print_bar(int n) {
    for (int i = 1; i <= n; i++) {
        printf("*");
    }
    printf("\n");
}

void print_rect(int w, int h)
{
  for (int r = 1; r <= h; r++) {print_bar (w);}
}

void print_score_bar(int score)
{
  print_bar(score/10);  
}


int main(void) {
    print_bar(5);
    print_rect(4, 5);
    print_score_bar(73);  
}