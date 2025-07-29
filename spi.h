#pragma once

typedef struct
{
    char TX;
    char CONTROL;
    char RX;
} __sys_hspi_t;

extern char __sys_sspiex(char *mosiport, char value);
extern char __sys_hspiex(__sys_hspi_t *host, char value);

extern void __sys_sspisend_arr(char *mosiport, const char *src, size_t len);
extern void __sys_sspireceive_arr(char *mosiport, char *dst, size_t len);
extern void __sys_sspiex_arr(char *mosiport, const char *src, char *dst, size_t len);
