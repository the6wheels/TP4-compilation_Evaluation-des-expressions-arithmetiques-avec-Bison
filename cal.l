%{
 #include "cal.tab.h"
 #include <stdlib.h>
 void yyerror(char *);
%}
%%
[0-9]+ {yylval = atoi(yytext); return Tnb;}
[-+()*\n/] { return *yytext; }
[ \t] ;
. {printf("Caractere (%c) non reconnu\n", yytext[0]); exit(0);}
%%
int yywrap(void) {
 return 1;
}
