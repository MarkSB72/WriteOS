#define UFCON0 ((volatile unsigned int *)(0x101f1000))
void hello_world(void)
{
    const char *p = "Hello World\r\n";
    while(*p)
    {
        *UFCON0 = *p++;
    };
    while(1);
}