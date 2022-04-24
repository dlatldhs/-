#include <stdio.h>
#include<stdlib.h>

#define Gi 32

char string_const[32];

typedef struct DATE_INTEGER {
    /* data */
    unsigned int d0:1,
                 d1:1,
                 d2:1,
                 d3:1,
                 d4:1,
                 d5:1,
                 d6:1,
                 d7:1;// Most Significant Bit
}DATE_INTEGER;

typedef struct DATE_DOUBLE {
    /* data */
    unsigned int m0:1,m1:1,m2:1,m3:1,m4:1,m5:1,m6:1,m7:1,m8:1,m9:1,m10:1,m11:1,m12:1,m13:1,m14:1,m15:1,m16:1,m17:1,m18:1,m19:1,m20:1,m21:1,m22:1,
                 e23:1,e24:1,e25:1,e26:1,e27:1,e28:1,e29:1,e30:1,
                 s31:1;
}DATE_DOUBLE;

typedef union INTT {
    DATE_INTEGER _ai;
    int hpi;
}INTT;

typedef union DOU {
    DATE_DOUBLE _af;
    float hpf;
}DOU;

void printing_INT(INTT v){
    printf("%d%d%d%d-%d%d%d%d",v._ai.d7,v._ai.d6,v._ai.d5,v._ai.d4,v._ai.d4,v._ai.d3,v._ai.d2,v._ai.d1,v._ai.d0);
}
void printing_DOU(DOU v){
    printf("%d-%d%d%d%d%d%d%d%d-%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d",v._af.s31, v._af.e30,v._af.e29,v._af.e28,v._af.e27,v._af.e26,v._af.e25,v._af.e24,v._af.e23,v._af.m22,v._af.m21,v._af.m20,v._af.m19,v._af.m18,v._af.m17,v._af.m16,v._af.m15,v._af.m14,v._af.m13,v._af.m12,v._af.m11,v._af.m10,v._af.m9,v._af.m8,v._af.m7,v._af.m6,v._af.m5,v._af.m4,v._af.m3,v._af.m2,v._af.m1,v._af.m0);
}

int main() {
    char read_string[32]={};
    INTT result_I;
    DOU result_D;
    int M=31,total=0;
    scanf("%s",read_string);
    result_I.hpi = atoi(read_string);
    result_D.hpf = atof(read_string);

    for (int i = 0; i < Gi; i++) {
        if ( read_string[i] == '.') {
            M--;
        }
    }

    if ( M < 31 ) {
        printing_DOU( result_D );
    }

    else {
        printing_INT( result_I );
    }

    return 0;
}