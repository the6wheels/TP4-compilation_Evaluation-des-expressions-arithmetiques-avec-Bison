%{
#include <stdio.h>
void yyerror(char *s);
int yylex(void);
%}
%token Tnb
%left '+' '-' '*' '/'
%%


P:P S '\n'
 |
 ;


S:E { printf("%d\n", $1); }
 ;


E:Tnb
 | '-' E { $$ = -$2; }
 | E '+' E { $$ = $1 + $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '*' E { $$ = $1 * $3; }
 | E '/' E { $$ = $1 * $3; }
 | '(' E ')' { $$ = $2; }
 ;


%%
void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}
int main()
{
if (yyparse() != 0)
{
fprintf(stderr,"Syntaxe incorrecte\n");
return 1;
}
else return 0;
}
