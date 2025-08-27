# SPI module for PDP-11-computers

## Software SPI
#### `__sys_sspiex`
`(char *mosiport, char value)`
char
#### `__sys_sspisend_arr`
`(char *mosiport, const char *src, size_t len)`
void
#### `__sys_sspireceive_arr`
`(char *mosiport, char *dst, size_t len)`
void
#### `__sys_sspiex_arr`
`(char *mosiport, const char *src, char *dst, size_t len)`
void
## Hardware SPI
#### `__sys_hspiex`
`(hspi_t *host, char value)`
char
#### `__sys_hspisend_arr`
`(hspi_t *host, const char *src, size_t len)`
void
#### `__sys_hspireceive_arr`
`(hspi_t *host, char *dst, size_t len)`
void
#### `__sys_hspiex_arr`
`(hspi_t *host, const char *src, char *dst, size_t len)`
void

## Usage
Will be soon.

