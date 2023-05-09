%{
#include "main.tab.h"
%}

%%
[/][/].*\n      ; // comment

Var     {return VAR;}
==      {return EQ;}
not     {return UNARY;} /* <Ун.оп.> */
WHILE   {return WHILE;}
DO      {return DO;}
Begin   {return BEGIN_T;}
End     {return END;}

[a-z]+  { yylval.text = strdup(yytext); return IDENT;} /* <Идент> */
[0-9]+	{ yylval.num = atoi(yytext); return CONST; } /* <Сonst> */

[ \t\r\n]       ; // whitespace
.	    {return (int) yytext[0];}

%%