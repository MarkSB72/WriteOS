#include "mmu.h"

typedef void (*init_func)(void);

#define UFCON0 ((volatile unsigned int *)(0x101F1000)) 

void hello_world(void)
{
    const char *p = "Hello World\r\n";
    while(*p)
    {
        *UFCON0 = *p++;
    };
}

static init_func init[] = 
{
    hello_world,
    0,
};

void plat_boot(void)
{
    int i;
    for(i = 0; init[i]; i ++)
    {
        init[i]();
    }
    init_sys_mmu();
    start_mmu();
    test_mmu();
    while(1);
}

