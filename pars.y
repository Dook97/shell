%{
#include <stdio.h>

int yyerror(char *str);
int yylex(void);
%}

%token IDENTIFIER
/* %token IN_REDIRECT OUT_REDIRECT OUT_REDIRECT_APPEND */
%token SEMICOLON
/* %token NEWLINE */

%%

statement:
    | command
    | command SEMICOLON statement
    ;

command: IDENTIFIER
    | command IDENTIFIER
    ;

%%

int yyerror(char *str) {
    fprintf(stderr, "error: %s\n", str);
    return 1;
}
