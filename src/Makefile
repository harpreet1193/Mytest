parser: parser.y lexer.l 
		bison -d  -v parser.y -o parser.tab.c
		flex -o lex.yy.c lexer.l 
		g++ -o parser main.cpp parser.tab.c lex.yy.c -ll
