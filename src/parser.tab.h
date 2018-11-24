/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    VOID = 259,
    RETURN = 260,
    CALLOUT = 261,
    CLASS = 262,
    ELSE = 263,
    IF = 264,
    FOR = 265,
    CONTINUE = 266,
    BREAK = 267,
    INT = 268,
    BOOLEAN = 269,
    TRUE = 270,
    FALSE = 271,
    OPEN_BRACE = 272,
    CLOSED_BRACE = 273,
    ADD = 274,
    SUB = 275,
    DIV = 276,
    MUL = 277,
    MOD = 278,
    LT = 279,
    GT = 280,
    LE = 281,
    GE = 282,
    ID = 283,
    HEX_LITERAL = 284,
    DECIMAL_LITERAL = 285,
    CHAR_LITERAL = 286,
    STRING_LITERAL = 287,
    SEMI_COLON = 288,
    COMMA = 289,
    PLUSEQUAL = 290,
    MINUSEQUAL = 291,
    EQUALS = 292,
    COND_OR = 293,
    COND_AND = 294,
    EQUALEQUAL = 295,
    NOTEQUAL = 296,
    NOT = 297,
    OPEN_SQUARE = 298,
    CLOSED_SQUARE = 299,
    OPEN_PAREN = 300,
    CLOSED_PAREN = 301
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "parser.y" /* yacc.c:1909  */

  char *str;
  int num;
  class Program *programPoint; //Create a Pointer to an object of class Program
  class FieldDeclarations *field_declPoint;
  class MethodDeclarations *method_declPoint;
 

#line 110 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
