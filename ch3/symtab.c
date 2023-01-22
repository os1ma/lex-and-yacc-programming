#include "symtab.h"
#include <string.h>
#include <stdlib.h>

#define NSYMS 20

extern int yyerror(char *);

struct symtab symtab[NSYMS];

struct symtab *symlook(char *s)
{
  struct symtab *sp;

  for (sp = symtab; sp < &symtab[NSYMS]; sp++)
  {
    if (sp->name && !strcmp(sp->name, s))
    {
      return sp;
    }

    if (!sp->name)
    {
      sp->name = strdup(s);
      return sp;
    }
  }
  yyerror("Too many symbols");
  exit(1);
}

void addfunc(char *name, double (*func)())
{
  struct symtab *sp = symlook(name);
  sp->funcptr = func;
}
