#include <iostream>
#include <cstdio>
#include <fstream>
// #include "ast.h"
#include "program.cpp"
extern "C" FILE *yyin;
extern "C" int yyparse();

class Program* root = NULL;

using namespace std;
int main()
{
	    FILE *myfile = fopen("temp1", "r" );
        
        if (!myfile) 
        {
            cout << "Can't open file: "  << endl;
            return -1;
        }


        yyin = myfile;
    	// parsing till we find EOF
	    do 
	    {
	    	// cout<<yyin;

	        yyparse();
	    } while (!feof(yyin));

        PostFixVisitor* start = new PostFixVisitor(root);
		start->start();
		
		printf("Parsing Over in main\n");
}