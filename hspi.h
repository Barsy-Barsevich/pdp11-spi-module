#pragma once

#include "spi_types.h"

char __sys_hspiex(hspi_t *host, char value);
void __sys_hspisend_arr(hspi_t *host, char *src, size_t len);
void __sys_hspireceive_arr(hspi_t *host, char *dst, size_t len);
void __sys_hspiex_arr(hspi_t *host, char *src, char *dst, size_t len);
