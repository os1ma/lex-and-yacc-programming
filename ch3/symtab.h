#pragma once

struct symtab
{
  char *name;
  double value;
};

struct symtab *symlook(char *s);
