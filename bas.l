%{
 #include "y.tab.h"
 #include <stdio.h>
 #include <stdlib.h>
 void yyeror(char* c);
%}

%%
[0-9]+              {
			        	yylval = atoi(yytext);
			    		return INTEIRO;
		            }			 			                          
[-+*/%=^:,]         { return *yytext; }
"IF"     			{ return IF; }
"ELSE"   			{ return ELSE; }
\n					{ return EOL; }
[ \t]				;
.                   ;

%%
int yywrap(void){
	return 1;
}