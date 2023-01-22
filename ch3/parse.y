%{
#include <stdio.h>

double vbltable[26];

extern int yylex(void);
extern int yyerror(char *);
%}

%union {
  double dval;
  int vblno;
}

%token <vblno> NAME
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%type <dval> expression

%%

statement_list: statement '\n'
              | statement_list statement '\n'
              ;

statement: NAME '=' expression { vbltable[$1] = $3; }
         | expression          { printf("= %g\n", $1); }
         ;

expression : expression '+' expression { $$ = $1 + $3; }
           | expression '-' expression { $$ = $1 - $3; }
           | expression '*' NUMBER { $$ = $1 * $3; }
           | expression '/' expression {
              if ($3 == 0) {
                yyerror("divide by zero");
              } else {
                $$ = $1 / $3;
              }
           }
           | '-' expression %prec UMINUS { $$ = -$2; }
           | '(' expression ')'    { $$ = $2; }
           | NUMBER            { $$ = $1; }
           | NAME              { $$ = vbltable[$1]; }
           ;
%%

int main(void) {
  yyparse();
  return 0;
}
