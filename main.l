%{
#include "main.tab.h"
%}

%%
"//".* /* Коммент */

[a-z]+ {return IDENT;} /* <Сonst> */
[0-9]+	{ yylval = atoi(yytext); return NUMBER; } /* <Цифра> */
not|- {return UNARY;} /* <Ун.оп.> */


%%