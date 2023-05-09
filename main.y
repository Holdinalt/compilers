%{
# include <stdio.h>
# include <stdlib.h>

#define YYERROR_VERBOSE 1

void yyerror(const char *str)
{
   fprintf(stderr, "Error: %s\n",str);
}

int yywrap()
{
   return 1;
}

struct tree {
    struct tree *child;
    struct tree *next;
    char *text;
    int num;
};

struct tree *new_tree_node (char *text, struct tree *child, struct tree *next)
{
    struct tree *node = malloc(sizeof(struct tree));
    node->text = text;
    node->child = child;
    node->next = next;
    return node;
}

struct tree *new_tree_node_int (int num, struct tree *child, struct tree *next)
{
    struct tree *node = malloc(sizeof(struct tree));
    node->text = NULL;
    node->num = num;
    node->child = child;
    node->next = next;
    return node;
}

static void print_tree(struct tree *cur, int lvl) {
    for(int i = 0; i < lvl; i++) printf("  ");
    if (cur->text)
        printf("%s\n", cur->text);
    else
        printf("num: %d\n", cur->num);
    if (cur->child != NULL)
      print_tree(cur->child, lvl + 1);
    if (cur->next != NULL)
      print_tree(cur->next, lvl);
}

void main();
%}

%start program
%union {
   struct tree *node;
   char *text;
   int num;
}

%token<text> IDENT
%token<num> CONST 
%token VAR EQ UNARY WHILE DO BEGIN_T END
%type<node> program vars var_list calculation_disc operators_list operator assignment
%type<node> expression unexpression bin_op operand complex_op cycle_op compose_op
%%

program: vars calculation_disc ';' {$$ = new_tree_node("program", $1, NULL);
                                $$->child->next = $2;
                                print_tree($$, 0);};

vars: VAR var_list {$$ = new_tree_node("vars", $2, NULL);};
var_list: IDENT {$$ = new_tree_node($1, NULL, NULL);}
        | IDENT ',' var_list {$$ = new_tree_node($1, NULL, NULL);
                                $$->next = $3;};

calculation_disc: operators_list {$$=new_tree_node("Calculations", $1, NULL);};
operators_list: operator {$$=new_tree_node("operator", $1, NULL);}
            | operator operators_list {$$=new_tree_node("Calculations", $1, NULL);
                                        $$->child->next = $2;};
operator: assignment {$$=new_tree_node("=", $1, NULL);}
        | complex_op {$$=new_tree_node("complex", $1, NULL);};

assignment: IDENT '=' expression {$$=new_tree_node($1, NULL, $3);};
expression: UNARY unexpression {$$=new_tree_node("not", $2, NULL);}
        | '-' unexpression {$$=new_tree_node("-", $2, NULL);}
        | unexpression {$$=$1;};
unexpression: '(' expression ')' {$$=new_tree_node("()", $2, NULL);}
        | operand {$$=$1;}
        | unexpression bin_op unexpression {$$=$2;
                                            $$->child = $1;
                                            $$->child->next = $3;};
bin_op: '-' {$$=new_tree_node("-", NULL, NULL);}
    | '+' {$$=new_tree_node("+", NULL, NULL);}
    | '*' {$$=new_tree_node("*", NULL, NULL);}
    | '/' {$$=new_tree_node("/", NULL, NULL);}
    | '<' {$$=new_tree_node("<", NULL, NULL);}
    | '>' {$$=new_tree_node(">", NULL, NULL);}
    | EQ {$$=new_tree_node("==", NULL, NULL);};
operand: IDENT {$$ = new_tree_node($1, NULL, NULL);}
        | CONST {$$ = new_tree_node_int($1, NULL, NULL);};

complex_op: cycle_op {$$=$1;}
        | compose_op {$$=new_tree_node("comp", $1, NULL);};
cycle_op: WHILE expression DO operator {$$=new_tree_node("while", $2, NULL);
                                        $$->child->next = $4;};
compose_op: BEGIN_T operators_list END {$$=$2;};

%%