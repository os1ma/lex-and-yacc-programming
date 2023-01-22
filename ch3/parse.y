%{
#include <stdio.h>

extern int yylex(void);
extern int yyerror(char *);
%}

%token NAME NUMBER

%%

statement: NAME '=' expression
         | expression          { printf("= %d\n", $1); }
         ;

expression : NUMBER '+' NUMBER { $$ = $1 + $3; }
           | NUMBER '-' NUMBER { $$ = $1 - $3; }
           | NUMBER            { $$ = $1; }
           ;
%%

int main(void) {
  yyparse();
  return 0;
}
