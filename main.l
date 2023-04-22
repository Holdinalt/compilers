%{
#include "main.tab.h"
%}

%%
"//".* /* Коммент */

[a-z]+ {return IDENT;} /* <Идент> */
[0-9]+	{ yylval = atoi(yytext); return CONST; } /* <Сonst> */
not|- {return UNARY;} /* <Ун.оп.> */


%%