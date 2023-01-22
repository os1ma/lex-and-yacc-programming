#pragma once

struct symtab
{
  char *name;
  double (*funcptr)();
  double value;
};

struct symtab *symlook(char *s);
void addfunc(char *name, double (*func)());