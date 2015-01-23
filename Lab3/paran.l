/* Checking Bracket Paranthesization */
%{
#include <stdio.h>
#include <math.h>
%}

	int co = 0;
	int cc = 0;




ANY [a-zA-Z0-9]*
WS  [\n\t ]*




%%
[(]	co++;
[)]	{
		cc++;
		if (cc > co)
		{
			printf("mismatch\n");
			exit(0);
		}
	}


%%
main(int argc, char ** argv)
{
	++argv, --argc;  /* skip over program name */
        if ( argc > 0 )
        	yyin = fopen( argv[0], "r" );
        else
        	yyin = stdin;
     
        yylex();
	printf(" ( = %d and )= %d\n", co, cc);
	if (co == cc)
	printf("Yes \n");
	
}

