#include "spi.h"

int spiex(spi_t *spi, char din, char *dout)
{
    if (spi == NULL)
    {
        return 1;
    }
    if (spi->sspi_enable)
    {
        *dout = __sys_sspiex(spi->sspi, din);
    }
    else
    {
        *dout = __sys_hspiex(spi->hspi, din);
    }
    return 0;
}

int spisend_arr(spi_t *spi, const char *din, size_t len)
{
    if (spi == NULL || din == NULL)
    {
        return 1;
    }
    if (spi->sspi_enable)
    {
        __sys_sspisend_arr(spi->sspi, din, len);
    }
    else
    {
        __sys_hspisend_arr(spi->hspi, din, len);
    }
    return 0;
}

int spireceive_arr(spi_t *spi, char *dout, size_t len)
{
    if (spi == NULL || dout == NULL)
    {
        return 1;
    }
    if (spi->sspi_enable)
    {
        __sys_sspireceive_arr(spi->sspi, dout, len);
    }
    else
    {
        __sys_hspireceive_arr(spi->hspi, dout, len);
    }
    return 0;
}

int spiex_arr(spi_t *spi, const char *din, char *dout, size_t len)
{
    if (spi == NULL || din == NULL || dout == NULL)
    {
        return 1;
    }
    if (spi->sspi_enable)
    {
        __sys_sspiex_arr(spi->sspi, din, dout, len);
    }
    else
    {
        __sys_hspiex_arr(spi->hspi, din, dout, len);
    }
    return 0;
}
