%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
void yyerror(char *);
%}



/* precedencia matematica */
%left TMAIS TMENOS
%left TMULTIPLICAR TDIVISAO

/*é preciso declarar os tokens escritos no lex.l*/
%token TPALAVRA


%start program

%%

program:
		program expr '\n'	{ printf("%d\n", $2); }
		|
		;
expr:
        TPALAVRA
        | expr '+' expr     {   char* s=malloc(sizeof(char)*(strlen($1)+strlen($3)+1));
                                strcpy(s,$1); strcat(s,$3);
                                $$=s;}
        ;
		INTEGER
		| expr '+' expr		{ $$ = $1 + $3; }
		| expr '-' expr		{ $$ = $1 - $3; }
		| expr '*' expr		{ $$ = $1 * $3; }
		| expr '/' expr		{ $$ = $1 / $3; }
        ;
                
%%