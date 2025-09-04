CC = gcc
CFLAGS =
DEBUG_CFLAGS = -g -O0 -Wall -Wextra
RELEASE_CFLAGS = -O2 -Wall -Wextra
LDFLAGS = -lpthread
TARGET = proxy
SRCS = proxy.c
OBJS = $(SRCS:.c=.o)

.PHONY: all debug release clean run

debug: $(OBJS)
	$(CC) $(DEBUG_CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

release: $(OBJS)
	$(CC) $(RELEASE_CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
