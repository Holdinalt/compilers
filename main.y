%{
# include <stdio.h>
void main();
%}


%token NUMBER
%token IDENT

%%

term: NUMBER
| UNARY term {$$ = - $2}

%%