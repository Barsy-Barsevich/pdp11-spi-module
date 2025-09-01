#pragma once

#include "spi_types.h"
#include "sspi.h"
#include "hspi.h"

int spiex(spi_t *spi, char din, char *dout);
int spisend_arr(spi_t *spi, const char *din, size_t len);
int spireceive_arr(spi_t *spi, char *dout, size_t len);
int spiex_arr(spi_t *spi, const char *din, char *dout, size_t len);
