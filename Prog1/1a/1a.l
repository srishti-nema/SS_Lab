%{
	#include<stdio.h>
	int id=0,optr=0, p=0,s=0,f=0;
%}
%%
[0-9][0-9]*	{ id++; printf("Identifiers are %s\n", yytext );}
[+ - * / ]	{ optr++; printf("Operators are %s\n", yytext);}
[(]		 {p++; }
[)]		{ p-- ;  }
%%
main()
{
	printf("enter an expression\n");
	yylex();
	if( id==optr+1 && p==0 && optr >=1)
	{
		printf("This is a valid expression\n");
		printf("Count of operators = %d\n Count of identifiers = %d\n", optr, id);
	}
	else
		printf("Invalid expression\n");
}
int yywrap()
{
	return 1;
}

