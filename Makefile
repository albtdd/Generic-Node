#
# Makefile
#
# Alberto Todde <alberto.tdd@gmail.com>
#

OS := $(shell uname)
ifeq ($(OS), Linux)
    CLEAN = rm -f
else # Windows
    CLEAN = del
endif

CC = gcc

CFLAGS = -std=c11 -Wall -Wpointer-arith -fstrict-aliasing -pedantic -Werror
DFLAGS = -DDEBUG -gO0
RFLAGS = -DNDEBUG -O3 -funroll-loops

LIBS =

SOURCES = node.c

OBJECTS = $(SOURCES:.c=.o)

OUTPUT_LIB = node.a

all: $(SOURCES) $(OUTPUT_LIB)
	
$(OUTPUT_LIB): $(SOURCES)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) -c $(SOURCES)
	ar ruv $(OUTPUT_LIB) $(OBJECTS)
	@echo " "
	@echo "[*]Done"
	@echo " "

.PHONY clean:
	rm -f $(OBJECTS)
