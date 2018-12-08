
%{
 #include "y.tab.h"
 #include <stdio.h>
 void yyeror(char* c);
 #
%}

%%
[0-9]+              {
			           yylval = atoi(yytext);
			           return INTEIRO;
		            }				 			                          
[+]					{ return SOMA;}
\n					{ return EOL; }
[ \t]				;
.                   ;

%%
int yywrap(void){
	return 1;
}