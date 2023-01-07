%{
#include "pars.tab.h"
%}

IDENTIFIER_CHAR ([!-~]{-}[#;])
BLANK_CHAR [\0- ]

%option noyywrap nodefault nounput noinput

%%
";"			{ return SEMICOLON; }
\n			{ /* return NEWLINE; */ }
"#"[^\n]*		{ /* ignore comments */ }
{BLANK_CHAR}+		{ /* ignore whitespace */ }
{IDENTIFIER_CHAR}+	{ return IDENTIFIER; }
.			{ fprintf(stderr, "Unknown token: %s\n", yytext); }
%%

int flex_scan_str(const char *str) {
	YY_BUFFER_STATE bs = yy_scan_string(str);
	yy_switch_to_buffer(bs);
	yyparse();
	yy_delete_buffer(bs);
	return 0;
}

int flex_scan_file(const char *path) {
	FILE *f = fopen(path, "r");
	if (f == NULL) {
		perror(path);
		return 1;
	}
	yyrestart(f);
	yyparse();
	fclose(f);
	return 0;
}
