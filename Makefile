.PHONY: all clean

all: mysh

clean:
	rm *.o mysh lex.yy.c

mysh: sh.c lex.yy.c
	cc -o $@ -lreadline sh.c lex.yy.c

lex.yy.c: lex.l
	flex lex.l
