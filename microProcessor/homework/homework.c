#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
typedef struct{
    /* data */
    unsigned int d0:1, d1:1, d2:1, d3:1, d4:1, d5:1, d6:1, d7:1,
        d8:1, d9:1, d10:1, d11:1, d12:1, d13:1, d14:1, d15:1,
        d16:1, d17:1, d18:1, d19:1, d20:1, d21:1, d22:1, d23:1,
        d24:1, d25:1, d26:1, d27:1, d28:1, d29:1, d30:1, d31:1;// Most Significant Bit
} bit_t;

typedef struct{
    /* data */
    unsigned int m:23,// 소ㅜㅅ
                 e:8,// 지수
                 s:1;// selector
} float_t;

typedef enum{
    TYPE_INTT,
    TYPE_FLOAT
} type_t;

int printing(void *n,char tem, type_t type){
    bit_t *p = (bit_t *)n;

    if (type == TYPE_INTT) {
        sprintf(tem, "%d%d%d%d-%d%d%d%d",p->d7, p->d6, p->d5, p->d4, p->d3, p->d2, p->d1, p->d0);    
    }

    else if ( type == TYPE_FLOAT ) {
        float_t *cfloat = (float_t *)n;
        sprintf(tem, "%d:%d%d%d%d-%d%d%d%d:%d%d%d-%d%d%d%d-%d%d%d%d-%d%d%d%d-%d%d%d%d-%d%d%d%d (%d:%d)",// 지수 가수
                        p->d31, 
                        p->d30, p->d29, p->d28, p->d27, p->d26, p->d25, p->d24, p->d23,
                        p->d22, p->d21, p->d20, p->d19, p->d18, p->d17, p->d16, p->d15,
                        p->d14, p->d13, p->d12, p->d11, p->d10, p->d9, p->d8, p->d7,
                        p->d6, p->d5, p->d4, p->d3, p->d2, p->d1, p->d0,
                        cfloat->e, cfloat->m);    
    }

    else {
        return -1;
    }

    return 0;
    
}

int main() {
    char int_data;
    float float_data;
    char tem[64],n[64];

    do {
        scanf("%s",n);// n = char 형 & 필요 X

        char *tes = strstr(n,".");// if (.) -> null else -> anything
        
        if ( tes != NULL ) {// .이 있다면 -> float
            
            if ( strstr(tes+1,".") != NULL) {// tes = * variable so tes + 1 => memory address + 1(char type)byte
                break;
            }// shutdown

            float_data = (float)afof(n);// n = char
            printing( &float_data, tem, TYPE_FLOAT); // float_data 주소 넘김, tem 으로 표준 출력 할거임, 위에서 float라는 거 인지 했으니까 type_float 

        }

        else {// 위에서 float 인거 거르니까 여기는 정수
            int_data = (char)atoi(n);// 정수인데 int로 하는건 char 은 1byte int는 4byte라서
            printing(&int_data, tem, TYPE_INTT);

        }

        printf("%s\n",tem);// tem은 위에 printing 에서 문자열이 안에 들어감
    }while(true);

    return 0;
}
