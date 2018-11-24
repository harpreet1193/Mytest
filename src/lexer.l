%{
	#include "parser.tab.h"
	#include "class_header.h"
	#include "program.cpp"
	int line = 1;
%}

%%
int {return INT;}
boolean {return BOOLEAN;}
break   {return BREAK;}
callout {return CALLOUT;}
class    {return CLASS;}
continue  {return CONTINUE;}
else      {return ELSE;}
for       {return FOR;}
if        {return IF;}
return    {return RETURN;}
void      {return VOID;} 
true      {return TRUE;}
false     {return FALSE;}
Program   {return PROGRAM;}
['][ !\"#$%&\'\(\)\*\+,\-\./0-9:;,=>?@A-Z\[\]\\^_`a-z{|}~][']   {return CHAR_LITERAL; }
["][ !\"#$%&\'\(\)\*\+,\-\./0-9:;,=>?@A-Z\[\]\\^_`a-z{|}~]*["]  {return STRING_LITERAL; }
0x[0-9a-fA-F]+ {return HEX_LITERAL; }
[1-9]?[0-9]+   {return DECIMAL_LITERAL; }
[_a-zA-Z][_a-zA-Z0-9]* {return ID; }
\+	{return ADD;}
\-	{return SUB;}
\*	{return MUL;}
\/	{return DIV;}
\(	{return OPEN_PAREN;}
\)	{return CLOSED_PAREN;}
\!  {return NOT;}
\%  {return MOD;}
\>  {return GT;}
\<  {return LT;}
\{  {return OPEN_BRACE;}
\}  {return CLOSED_BRACE;}
\[  {return OPEN_SQUARE;}
\]  {return CLOSED_SQUARE;}
\,  {return COMMA;}
\;  {return SEMI_COLON;}
\=  {return EQUAL;}
"+=" {return PLUSEQUAL;}
"-=" {return MINUSEQUAL;}
">=" {return LE;}
"<=" {return GE;}
"==" {return EQUALEQUAL;}
"!=" {return NOTEQUAL;}
"&&" {return COND_AND;}
"||"	{return COND_OR;}
.		{ printf("Wrong character %s at %d", yytext, line);}
[ \t]	{ }
\n		{++line;}
%%

