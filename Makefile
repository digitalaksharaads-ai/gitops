CC=gcc
CFLAGS=-Wall -g
SRC=$(wildcard src/*.c)
OBJ=$(SRC:.c=.o)
TARGET=app

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)
