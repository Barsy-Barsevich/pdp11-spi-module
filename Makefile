include pdp11_tools.mk

all:
	${AS} src/spi.S -o spi.o

clean:
	rm spi.o
