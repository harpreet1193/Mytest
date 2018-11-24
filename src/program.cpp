#include "class_header.h"
#include <bits/stdc++.h>
using namespace std;

class PostFixVisitor: public ASTvisitor {
    Program *root;
    public:
    	PostFixVisitor(Program *_root){
    		this->root = _root;
    	}
    	void start(){
    		root->accept(*this);
    	}
    	virtual void visit(Program &program){
    		program.getfield_decl()->accept(*this);
        	program.getmethod_decl()->accept(*this);
    		cout<<" Reached Program section "<<endl;
    	}
    	virtual void visit(FieldDeclarations &field_decl){
    		cout<<" Reached Program section "<<endl;
    	}
    	virtual void visit(MethodDeclarations &method_decl){
    		cout<<" Reached Program section "<<endl;
    	}
    };