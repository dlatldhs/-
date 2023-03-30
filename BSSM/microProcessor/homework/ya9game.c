#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MAX_ITEMS   3
#define DEBUG       1


// int P[MAX_ITEMS];
// int U[MAX_ITEMS];
// int s, b;

typedef struct P_T
{
    /* data */
    unsigned int P_T_In : 4;
} P_T;

typedef struct U_T
{
    /* data */
    unsigned int U_T_IN : 4;
} U_T;

typedef struct B_game_t
{
    /* data */
    
    // P
    P_T *P[3];
    
    // U
    U_T *U[3];

    // S
    unsigned int S : 2;
    // B
    unsigned int B : 2;
}B_game_t;

B_game_t SBPU;

void init_prediction(void)// 초기 값 세팅
{
    int table[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    srandom(time(NULL));

    for (int x, i = 0; i < MAX_ITEMS; i++) {
        do {
            x = random() % 10;
        } while (table[x] == -1);

        SBPU.P[i] = table[x];
        table[x] = -1;
    }
}

void input_user_data(void)// 데이터 input 받는거 사용자한테
{
    scanf("%d %d %d", &SBPU.U[0], &SBPU.U[1], &SBPU.U[2]);
}

void compare_PU(void)// 비교하는거
{
    SBPU.S = SBPU.B = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (i == j) {
                if (SBPU.P[i] == SBPU.U[i]) SBPU.S++;
            }
            else {
                if (SBPU.P[i] == SBPU.U[j]) SBPU.B++;
            }
        }
    }

//     // S++
//     for ( int i = 0; i < 3; i++) {
//             if ( P[i] == U[i]) s++;
//         }

//     // B++
//     for (int i=0;i<3;i++) {
//         int tw = i+1;
//         int th = i+2;
//         if (tw <= 3) {
//             tw += -3;
//         }
//         if (th <= 3) {
//             th += -3;
//         }
//         if (P[i] == U[tw]){
//             b++;
//         }
//         if (P[i] == U[th]){
//             b++;
//         }

//     }
}

void show(void)// 출력하는거
{
    printf ("s = %d, b = %d\n", SBPU.S, SBPU.B);
    if (DEBUG) {
        printf("%d %d %d\n", SBPU.P[0], SBPU.P[1], SBPU.P[2]);
    }
}

int main()
{
    init_prediction();

    do {
        input_user_data();
        compare_PU();
        show();
    } while(SBPU.S != 3);
}
