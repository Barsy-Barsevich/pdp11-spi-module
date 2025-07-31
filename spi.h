#pragma once

#include <stdint-gcc.h>
#include <stddef.h>

typedef struct
{
    union
    {
        volatile uint16_t TX;
        volatile uint16_t RX;
    };
    volatile uint16_t START;
} hspi_t;

extern char __sys_sspiex(char *mosiport, char value);
extern void __sys_sspisend_arr(char *mosiport, const char *src, size_t len);
extern void __sys_sspireceive_arr(char *mosiport, char *dst, size_t len);
extern void __sys_sspiex_arr(char *mosiport, const char *src, char *dst, size_t len);

uint8_t __sys_hspiex(hspi_t *host, uint8_t value);
void __sys_hspisend_arr(hspi_t *host, uint8_t *src, size_t len);
void __sys_hspireceive_arr(hspi_t *host, uint8_t *dst, size_t len);
void __sys_hspiex_arr(hspi_t *host, uint8_t *src, uint8_t *dst, size_t len);
