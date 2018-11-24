%{
	#include <stdio.h>
	#include <stdlib.h>
	extern int line_number;
    int yylex(void);
	void yyerror(const char *s);
    #include "program.cpp"
	class Program* root = NULL;
%}


%union{
  char *str;
  int num;
  class Program *programPoint; //Create a Pointer to an object of class Program
  class FieldDeclarations *field_declPoint;
  class MethodDeclarations *method_declPoint;
 }





/* Tokens */
%token PROGRAM VOID RETURN CALLOUT CLASS
%token ELSE IF FOR CONTINUE BREAK 
%token INT BOOLEAN TRUE FALSE
%token OPEN_BRACE CLOSED_BRACE
%token ADD SUB DIV MUL MOD
%token LT GT LE GE
%token ID HEX_LITERAL DECIMAL_LITERAL CHAR_LITERAL STRING_LITERAL
%token SEMI_COLON COMMA

/*precedence */

%right PLUSEQUAL MINUSEQUAL
%right EQUALS
%left COND_OR
%left COND_AND
%left EQUALEQUAL NOTEQUAL
%left LE GE LT GT 
%left ADD SUB
%left MUL DIV MOD
%right NOT
%left OPEN_SQUARE CLOSED_SQUARE
%left OPEN_PAREN CLOSED_PAREN


/*nterms*/
%type <program> program
%type <field_decl> field_decl
%type <method_decl> method_decl

%%

program : CLASS PROGRAM OPEN_BRACE field_decl method_decl CLOSED_BRACE {$$ = new Program($4, $5);root=$$;}
        | CLASS PROGRAM OPEN_BRACE field_decl CLOSED_BRACE	{$$ = new Program($4);root=$$;}
        | CLASS PROGRAM OPEN_BRACE method_decl CLOSED_BRACE	{$$ = new Program($4);root=$$;}
        | CLASS PROGRAM OPEN_BRACE CLOSED_BRACE	{$$ = new Program();root=$$;}
        ;

field_decl  : type data 
            | field_decl data 
            ;

type    : INT
        | BOOLEAN
        ;


data    : ID
        | ID OPEN_SQUARE int_literal CLOSED_SQUARE
        | ID COMMA data
        | ID OPEN_SQUARE int_literal CLOSED_SQUARE COMMA data


method_decl : method 
            | method_decl method 
            ;

method  : type ID OPEN_PAREN params CLOSED_PAREN block
        | type ID OPEN_PAREN CLOSED_PAREN block
        | VOID ID OPEN_PAREN params CLOSED_PAREN block 
        | VOID ID OPEN_PAREN CLOSED_PAREN block
        ;

params  : type ID 
        | type ID COMMA params
        ;

block   : OPEN_BRACE CLOSED_BRACE
        | OPEN_BRACE var_decl CLOSED_BRACE
        | OPEN_BRACE statement_star CLOSED_BRACE
        | OPEN_BRACE var_decl statement_star CLOSED_BRACE
        ;

var_decl    :   var
            |   var_decl var
            ;

var :   type id_star SEMI_COLON
        ;



id_star    : ID
        | ID COMMA id_star
        ;

statement_star      : statement
                | statement_star statement
                ;

statement       : location assign_op expr SEMI_COLON
                | method_call SEMI_COLON
                | IF OPEN_PAREN expr CLOSED_PAREN block 
                | IF OPEN_PAREN expr CLOSED_PAREN block ELSE block
                | FOR ID EQUALS expr SEMI_COLON expr block
                | RETURN SEMI_COLON
                | RETURN expr SEMI_COLON
                | BREAK SEMI_COLON
                | CONTINUE SEMI_COLON
                | block
                ;

location        : ID    
                | ID OPEN_SQUARE expr CLOSED_SQUARE
                ;

assign_op       : SUB
                | PLUSEQUAL 
                | MINUSEQUAL
                ;


method_call     : method_name OPEN_PAREN expr_star CLOSED_PAREN
                | method_name OPEN_PAREN CLOSED_PAREN
                | CALLOUT OPEN_PAREN STRING_LITERAL CLOSED_PAREN
                | CALLOUT OPEN_PAREN STRING_LITERAL SEMI_COLON callout_arg_star CLOSED_PAREN

method_name     : ID

expr_star  : expr 
        | expr COMMA expr_star
        ;

callout_arg_star   : callout_arg
                | callout_arg COMMA callout_arg_star
                ;

callout_arg     : expr  
                | STRING_LITERAL
                ;


expr    : location
        | method_call
        | literal
        | expr ADD expr
        | expr SUB expr 
        | expr MUL expr   
        | expr DIV expr   
        | expr MOD expr    
        | expr LT expr 
        | expr GT expr  
        | expr LE expr  
        | expr GE expr  
        | expr EQUALEQUAL expr    
        | expr NOTEQUAL expr   
        | expr COND_AND expr   
        | expr COND_OR expr    
        | SUB expr     
        | NOT expr
        | OPEN_PAREN expr CLOSED_PAREN
	;	



literal : int_literal
        | CHAR_LITERAL
        | bool_literal
        ;

int_literal : DECIMAL_LITERAL
            | HEX_LITERAL
            ;

bool_literal    : TRUE
                | FALSE
                ;

%%

//void main(int argc, char **argv)
//{
//	yyparse();
//	printf("Parsing Over\n");
//}

void yyerror(const char *s)
{
	fprintf(stderr, "error : %s number: %d\n", s, line_number);
        exit(-1);
}