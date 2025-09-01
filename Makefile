include pdp11_tools.mk

all:
	${AS} src/sspi.S -o build/sspi.o
	${AS} src/hspi.S -o build/hspi.o
	${GCC} -c src/hspi.c -I . -o build/hspi_c.o
	${GCC} -c src/spi.c -I . -o build/spi.o

clean:
	rm -r build
