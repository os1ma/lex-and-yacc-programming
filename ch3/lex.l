%{
#include "parse.tab.h"
#include <math.h>
#include "symtab.h"
%}

%%
[0-9]+ { yylval.dval = atof(yytext); return NUMBER; }
[ \t]  ;
[a-z]+ { yylval.symp = symlook(yytext); return NAME; }
"$"    { return 0; }
\n     |
.      return yytext[0];
%%
