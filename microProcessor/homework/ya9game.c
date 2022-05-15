#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MAX_ITEMS   3
#define DEBUG       1

int P[MAX_ITEMS];
int U[MAX_ITEMS];
int s, b;

void init_prediction(void)// 초기 값 세팅
{
    int table[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    srandom(time(NULL));

    for (int x, i = 0; i < 3; i++) {
        do {
            x = random() % 10;
        } while (table[x] == -1);

        P[i] = table[x];
        table[x] = -1;
    }
}

void input_user_data(void)// 데이터 input 받는거 사용자한테
{
    scanf("%d %d %d", &U[0], &U[1], &U[2]);
}

void compare_PU(void)// 비교하는거
{
    s = b = 0;
    /*for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (i == j) {
                if (P[i] == U[i]) s++;
            }
            else {
                if (P[i] == U[j]) b++;
            }
        }
    }*/
    // S++
    for ( int i = 0; i < 3; i++) {
            if ( P[i] == U[i]) s++;
        }

    // B++
    for (int i=0;i<3;i++) {
        int tw = i+1;
        int th = i+2;
        if (tw <= 3) {
            tw += -3;
        }
        if (th <= 3) {
            th += -3;
        }
        if (P[i] == U[tw]){
            b++;
        }
        if (P[i] == U[th]){
            b++;
        }

    }
}

void show(void)// 출력하는거
{
    printf ("s = %d, b = %d\n", s, b);
    if (DEBUG) {
        printf("%d %d %d\n", P[0], P[1], P[2]);
    }
}

int main()
{
    init_prediction();

    do {
        input_user_data();
        compare_PU();
        show();
    } while(s != 3);
}
