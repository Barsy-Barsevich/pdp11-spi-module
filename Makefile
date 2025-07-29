include pdp11_tools.mk

all:
	${AS} src/sspi.S src/hspi.S -o spi.o

clean:
	rm spi.o
