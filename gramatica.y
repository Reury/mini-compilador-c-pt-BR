%{
#include<stdio.h>
void yyerror(char *c);
int yylex(void)
%}
%token INTEIRO SOMA EOL 

%%
PROGRAMA:
		PROGRAMA EXPRESSAO EOL;
		|
EXPRESSAO:
		EXPRESSAO SOMA EXPRESSAO{
			$$ = $1 + $3;
			printf("Expressao: %d + %d = %d \n", $1,$3, $1+$3);
		}
		|INTEIRO { $$ = $1; }
        ;
%%
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
int main(void){
	yyparse();
	return 0;
}