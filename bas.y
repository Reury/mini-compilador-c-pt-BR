%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *s);
%}
%token INTEIRO OCTAL EOL
%left  '+'  '-'
%left  '*'  '/'

%%
PROGRAMA:
		PROGRAMA EXPRESSAO EOL;
		|
EXPRESSAO:
		EXPRESSAO '+' EXPRESSAO{
			$$ = $1 + $3;
			printf("Expressao: %d + %d = %d \n", $1,$3, $1+$3);
		}
        |   EXPRESSAO  '-'  EXPRESSAO{
			$$ = $1 - $3;
			printf("Expressao: %d - %d = %d \n", $1,$3, $1-$3);
		}
        |   EXPRESSAO  '*'  EXPRESSAO{
			$$ = $1 * $3;
			printf("Expressao: %d * %d = %d \n", $1,$3, $1*$3);
		}
		|  EXPRESSAO  '/'  EXPRESSAO{
			$$ = $1 / $3;
			printf("Expressao: %d / %d = %d \n", $1,$3, $1/$3);
		}		
		|INTEIRO { $$ = $1; }
		|OCTAL { $$ = $1; }
        ;
%%
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
int main(void){
	yyparse();
	return 0;
}