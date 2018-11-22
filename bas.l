%{
 #include "y.tab.h"
 #include <stdio.h>
 void yyeror(char* c);
%}

%%
[0-9]+              {
			           yylval = atoi(yytext);
			           return INTEIRO;
		            }
[0-9]+.[0-9]*		{
				    yylval = atoi(yytext);
			        return DOUBLE;						
					}
[0-7]+				{
				    yylval = atoi(yytext);
			        return OCTAL;		                
					}					 			                          
[-+*/%=^:,]         { return *yytext; }
\n					{ return EOL; }
[ \t]				;
.                   ;

%%
int yywrap(void){
	return 1;
}