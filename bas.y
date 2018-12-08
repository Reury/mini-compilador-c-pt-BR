%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *s);
%}
%token INTEIRO
%token OCTAL
%token BINARIO
%token HEXA
%token EOL
%token IF
%token WHILE
%token FOR

%left  '+'  '-'
%left  '*'  '/'

%%
PROGRAMA:
		PROGRAMA expressao EOL
		PROGRAMA EOL
		|
		;
expressao:
		argumento					
		| IF '(' argumento ')'					{ $$ = $3;}
		| WHILE '(' argumento ')' argumento		{ $$ = $3;}	
		| FOR '('argumento ')' argumento		{ $$ = $3;}			
		;
argumento:
		INTEIRO						{printf("e valido\n");}
		| OCTAL						{printf("e valido\n");}
		| BINARIO					{printf("e valido\n");}
		| HEXA						{printf("e valido\n");}
		| IF argumento 				{printf("IF simples\n");}		
		| WHILE argumento argumento {printf("while correto");}
		| FOR argumento argumento 	{printf("for correto");}							
		;


%%
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
int main(void){
	yyparse();
	return 0;
}