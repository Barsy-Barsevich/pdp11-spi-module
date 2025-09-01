#pragma once

#include "spi_types.h"

extern char __sys_sspiex(char *mosiport, char value);
extern void __sys_sspisend_arr(char *mosiport, const char *src, size_t len);
extern void __sys_sspireceive_arr(char *mosiport, char *dst, size_t len);
extern void __sys_sspiex_arr(char *mosiport, const char *src, char *dst, size_t len);
