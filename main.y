%{
# include <stdio.h>

#define YYERROR_VERBOSE 1

void yyerror(const char *str)
{
   fprintf(stderr, "Error: %s\n",str);
}

int yywrap()
{
   return 1;
}

void main();
%}

%start program

%token CONST IDENT VAR EQ UNARY WHILE DO BEGIN_T END
%type program vars var_list calculation_disc operators_list operator assignment
%type expression unexpression bin_op operand complex_op cycle_op compose_op
%%

program: vars calculation_disc;

vars: VAR var_list;
var_list: IDENT 
        | IDENT ',' var_list;

calculation_disc: operators_list;
operators_list: operator
            | operator operators_list;
operator: assignment
        | complex_op;

assignment: IDENT '=' expression;
expression: UNARY unexpression
        | '-' unexpression
        | unexpression;
unexpression: '(' expression ')'
        | operand
        | unexpression bin_op unexpression;
bin_op: '-' | '+' | '*' | '/' | '<' | '>' | EQ;
operand: IDENT
        | CONST;

complex_op: cycle_op
        | compose_op;
cycle_op: WHILE expression DO operator;
compose_op: BEGIN_T operators_list END;

%%