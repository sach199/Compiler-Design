/* Lex Analyser using FLEX */
%{
#include <math.h>
%}
DIGIT	[0-9]
ID	[a-z][a-z0-9]
%%

[ \t\n]+

["][a-zA-Z %]*["]	printf("String Constant\n");
"/*"[a-zA-Z0-9 ]*"*/"	printf("Single Line Comment\n");
"#include <"[a-z]+"."[a-z]+">"	printf("Header File\n");
{DIGIT}+	printf("int, (%s)\n", yytext);
{DIGIT}+"."{DIGIT}*	printf("float, (%s)\n", yytext);
return|if|else|int|float|void|main|scanf|printf	printf("keyword, %s\n", yytext);
[a-z]{ID}*	printf("Identifier, %s\n", yytext);
"+"|"-"|"*"|"/"|"<"|">"|"="|"=="|">="|"<="	printf("operator, %s\n", yytext);
["]+[a-z ]+["]+
[)(%;,]+	printf("Delimiter %s\n", yytext);
.
%%
     
int main( int argc, char **argv )
{
	++argv, --argc;  /* skip over program name */
        if ( argc > 0 )
        	yyin = fopen( argv[0], "r" );
        else
        	yyin = stdin;
     
        yylex();
}




