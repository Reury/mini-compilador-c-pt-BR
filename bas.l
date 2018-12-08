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
O[0-7][0-7]*     	{
    				yylval = atoi(yytext);
 					return OCTAL;		
					}	
0x[0-1][0-1]* 		{ 
						yylval = atoi(yytext);
						return BINARIO;
					}
0h[0-9a-f]			{	 
						yylval = atoi(yytext);
						return HEXA;
					}								 			                          
[-+*/%=^:,]         { return *yytext; }
[IF]				{ return IF;}
[WHILE]				{ return WHILE;}
[FOR]				{return FOR; }
\n					{ return EOL; }
[ \t]				;
.                   ;

%%
int yywrap(void){
	return 1;
}