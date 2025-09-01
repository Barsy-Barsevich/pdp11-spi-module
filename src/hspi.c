#include "spi.h"

char __sys_hspiex(hspi_t *host, char value)
{
    host->TX = value;
    host->START = value;
    asm volatile("nop");
    return host->RX;
}

void __sys_hspisend_arr(hspi_t *host, char *src, size_t len)
{
    while (len-- != 0)
    {
        host->TX = *src++;
        host->START = 0;
        asm volatile("nop");
    }
}

void __sys_hspireceive_arr(hspi_t *host, char *dst, size_t len)
{
    while (len-- != 0)
    {
        host->TX = 0;
        host->START = 0;
        asm volatile("nop");
        *dst++ = host->RX;
    }
}

void __sys_hspiex_arr(hspi_t *host, char *src, char *dst, size_t len)
{
    while (len-- != 0)
    {
        host->TX = *src++;
        host->START = 0;
        asm volatile("nop");
        *dst++ = host->RX;
    }
}
