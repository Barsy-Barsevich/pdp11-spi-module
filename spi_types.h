#pragma once

#include <stdint-gcc.h>
#include <stddef.h>
#include <stdbool.h>

typedef char sspi_t;

typedef struct
{
    union
    {
        volatile uint16_t TX;
        volatile uint16_t RX;
    };
    volatile uint16_t START;
} hspi_t;

typedef struct
{
    union
    {
        sspi_t *sspi;
        hspi_t *hspi;
    };
    bool sspi_enable;
} spi_t;
