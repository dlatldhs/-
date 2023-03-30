#include <stdio.h>
#include <stdbool.h>
#include "thread.h"
#include <unistd.h>
#define MAX 16

// direct_reg selector & input/output
int gpio_pin_direct_reg[MAX];
int gpio_pin_in_value_reg[MAX];
int gpio_pin_out_value_reg[MAX];

void gpio_pin_in(i) {
    fprintf(stderr,"[gpio_pin%d][IN:%d]\n",i+1,gpio_pin_in_value_reg[i]);
}
void gpio_pin_out(i) {
    fprintf(stderr,"[gpio_pin%d][OUT:%d]\n",i+1,gpio_pin_out_value_reg[i]);
}

void* gpio_pin(void* unuse){
    while(true){
        for (int i=0; i<MAX; i++) {
            if (gpio_pin_direct_reg[i]){
                gpio_pin_in(i);
            }
            else {
                gpio_pin_out(i);
            }
        }
        usleep(1e6);
    }
}


int main(){
    thread_create(gpio_pin,0);
    while(true){
        int d,n;
        scanf("%d",&d);
        for (int i=0; i < MAX; i++){
            gpio_pin_direct_reg[i] = d;
        }
        scanf("%d",&n);
        for (int i=0; i<MAX; i++){
            if (gpio_pin_direct_reg[i]) {
                gpio_pin_in_value_reg[i]  = n;
            }
            else {
                gpio_pin_out_value_reg[i] = n;
            }
        }
    }
}