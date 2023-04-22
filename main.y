%{
# include <stdio.h>
void main();
%}


%token CONST
%token IDENT

%%

term: CONST
| UNARY term {$$ = - $2}

%%