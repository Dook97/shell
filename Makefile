.PHONY: all clean

all: mysh

clean:
	rm *.o mysh lex.yy.c pars.tab.c pars.tab.h

mysh: sh.c lex.yy.c pars.tab.c
	cc -o $@ -lreadline -lfl sh.c lex.yy.c pars.tab.c

lex.yy.c: lex.l pars.tab.h
	flex lex.l

pars.tab.c pars.tab.h: pars.y
	bison -d pars.y
