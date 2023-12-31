CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=gnu2x
OUT = map_test
CFILES = $(shell find . -type f -name '*.c')
COBJS = $(CFILES:.c=.o)

.PHONY: all release debug clean

all: debug

release: CFLAGS += -O2
release: $(OUT)

debug: CFLAGS += -g -fsanitize=address -fsanitize=undefined
debug: $(OUT)

$(OUT): $(COBJS)
	$(CC) $(CFLAGS) $(COBJS) -o $(OUT) 
	
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(COBJS) $(OUT)
