%{
#include<stdio.h>
%}
%%
[0-9]+ {yyval=atoi(yytext);return Tnb;}
[-+*/] {return yytex[0];}
[\n\t]+;
.{printf("error (%c)", yytex[0]); exit(0);}
%%
main()
{yyparse();
}
