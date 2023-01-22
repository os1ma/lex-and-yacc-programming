CC = gcc

CFLAGS = -Wall -W -O2

TARGET = main

SRC = symtab.c
LEX_SRC = lex.l
YACC_SRC = parse.y

LEX_C = $(LEX_SRC:.l=.yy.c)
YACC_C = $(YACC_SRC:.y=.tab.c)
YACC_H = $(YACC_SRC:.y=.tab.h)

$(TARGET): $(SRC) $(LEX_C) $(YACC_C)
	$(CC) $(CFLAGS) -o $@ $^ -lfl -ly -lm

$(LEX_C): $(LEX_SRC) $(YACC_H)
	flex -o $@ $^

$(YACC_C) $(YACC_H): $(YACC_SRC)
	bison -d $^

clean:
	rm -f $(TARGET) $(LEX_C) $(YACC_C) $(YACC_H)
