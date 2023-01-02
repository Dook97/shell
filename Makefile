.PHONY: all clean

all: mysh

clean:
	rm *.o mysh

mysh: sh.c lex.l pars.y
