#ifndef WHY_IS_THIS
#define WHY_IS_THIS

// union Node{
// 	char *str;
// 	int num;
// 	class Program *program; //Create a Pointer to an object of class Program
// 	class FieldDeclarations *field_decl;
// 	class MethodDeclarations *method_decl;
// };
// typedef union Node YYSTYPE;


class ASTvisitor{
public:
	virtual void visit(Program &program) = 0;
	virtual void visit(FieldDeclarations &field_decl) = 0;
	virtual void visit(MethodDeclarations &method_decl) = 0;
};

class ASTnode {
public:
    virtual void accept(ASTvisitor& V) = 0;
};


class Program: public ASTnode {
	private:
	    class FieldDeclarations *field_decl;
	    class MethodDeclarations *method_decl;

	public:
	    Program(class FieldDeclarations *field_decl , class MethodDeclarations *method_decl){
	    	this->field_decl=field_decl;
	    	this->method_decl=method_decl;
	    };
	    
	    Program(class MethodDeclarations *method_decl){
	    	this->field_decl=NULL;
	    	this->method_decl=method_decl;};

	    Program(class FieldDeclarations *method_decl){
	    	this->field_decl=field_decl;
	    	this->method_decl=NULL;};
	    
	    Program(){
	    	this->field_decl=NULL;
	    	this->method_decl=NULL;
	    };
	    class FieldDeclarations* getfield_decl(){
	    	return field_decl;
	    }
	    class MethodDeclarations* getmethod_decl(){
	    	return method_decl;
	    }
	    virtual void accept(ASTvisitor &v) {
	        v.visit(*this);
	    }
};

class FieldDeclarations: public ASTnode {
	public:

	virtual void accept(ASTvisitor &v) {
	        v.visit(*this);
	    }
};

class MethodDeclarations: public ASTnode{
	public:
		
	virtual void accept(ASTvisitor &v) {
	        v.visit(*this);
	    }
};
#endif