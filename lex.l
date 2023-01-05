%{
/* #include "pars.tab.h" */
%}

IDENTIFIER_CHAR ([!-~]{-}["#'<>;])
BLANK_CHAR [\0- ]

%option noyywrap nodefault nounput noinput

%%
";"			{ puts("SEMICOLON"); }
\n			{ puts("NEWLINE"); }
"#"[^\n]*		{ /* ignore comments */ }
{BLANK_CHAR}+		{ /* ignore whitespace */ }
{IDENTIFIER_CHAR}+	{ printf("IDENTIFIER: %s\n", yytext); }
.			{ printf("UNKNOWN: %s\n", yytext); }
%%

void flex_scan_str(const char *str) {
	YY_BUFFER_STATE bs = yy_scan_string(str);
	yy_switch_to_buffer(bs);
	yylex();
	yy_delete_buffer(bs);
}
