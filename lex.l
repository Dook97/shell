%option noyywrap
%option nodefault

%{
#include "pars.tab.h"
%}

%%
";"			{ return SEMICOLON; }
\n			{ return EOL; }
[ \t]		{ /* ignore whitespace */ }
%%
