'''
Tree nodes for all the classes
These are read in from the file
'''

# *** CLASS ***
class ClassObj(object):
    '''
    Class object
    '''
    def __init__(self, _class_info, _check_inherits, _parent, _feature_list):
        self.class_info = _class_info
        self.check_inherits = _check_inherits
        self.parent = _parent
        self.feature_list = _feature_list

    def __repr__(self):
        ret = f"CLASS: {self.class_info.name}"
        return ret

# *** CLASS FEATURES ***
class Feature(object):
    '''
    Base class for Attribute and Method
    '''
    def __init__(self, _in_class, _identifier):
        self.in_class = _in_class
        self.identifier = _identifier

class Attribute(Feature):
    '''
    Attribute class. Inherits from feature
    '''
    def __init__(self, _in_class, _identifier, _typename, _expr=None):
        Feature.__init__(self, _in_class, _identifier)
        self.typename = _typename
        self.expr = _expr

    def __repr__(self):
        ret = f"{self.identifier.lineno}\n{self.identifier}\n{self.typename.lineno}\n{self.typename.name}\n"
        return ret

class Method(Feature):
    '''
    Method class. Inherits from feature
    '''
    def __init__(self, _in_class, _identifier, _formals_list, _typename, _body):
        Feature.__init__(self, _in_class, _identifier)
        self.formals_list = _formals_list
        self.typename = _typename
        self.body = _body

    def __repr__(self):
        ret = f"{self.identifier}\n{self.formals_list}\n{self.typename}\n{self.body}\n"
        return ret

class Internal(object):
    '''
    A class for Internal cool objects
    This includes Bool, Int, IO, Object, and String
    '''
    def __init__(self, _in_class, _lineno, _type_of, _exp_name, _method_name):
        self.in_class = _in_class
        self.lineno = _lineno
        self.type_of = _type_of
        self.exp_name = _exp_name
        self.method_name = _method_name

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\n{self.exp_name}\n{self.method_name}"
        return ret


# *** TERMINAL EXPRESSIONS ***
class Expression(object):
    '''
    Expression base class
    Includes the line number and the type of the node
    '''
    def __init__(self, _in_class, _lineno, _type_of):
        self.in_class = _in_class
        self.lineno = _lineno
        self.type_of = _type_of

class Identifier(object):
    '''
    Identifier object
    '''
    def __init__(self, _in_class, _lineno, _name):
        self.in_class = _in_class
        self.lineno = _lineno
        self.name = _name

    def __repr__(self):
        ret = f"{self.name}"
        return ret

class IdentifierExp(Expression):
    '''
    Identifier expression object
    '''
    def __init__(self, _in_class, _lineno, _type_of, _identifier):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.identifier = _identifier

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nidentifier\n"
        ret += f"{self.identifier.lineno}\n{self.identifier}"
        return ret

    def exp_print(self):
        '''
        Print expr
        '''
        ret = f"{self.identifier}"
        return ret

class Integer(Expression):
    '''
    Integer expression object
    '''
    def __init__(self, _in_class, _lineno, _type_of, _value):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.value = _value

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\ninteger\n{self.value}"
        return ret

    def exp_print(self):
        '''
        Print exp
        '''
        ret = f"{self.value}"
        return ret

class StringObj(Expression):
    '''
    String expression object
    '''
    def __init__(self, _in_class, _lineno, _type_of, _value):
        Expression.__init__(self,_in_class, _lineno, _type_of)
        self.value = _value

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nstring\n{self.value}"
        return ret

    def exp_print(self):
        '''
        Print exp
        '''
        ret = f"{self.value}"
        return ret

class Bool(Expression):
    '''
    Bool base class
    '''
    def __init__(self, _in_class, _lineno, _value):
        Expression.__init__(self, _in_class, _lineno, "Bool")
        self.value = _value

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\n{self.value}"
        return ret

    def exp_print(self):
        '''
        Print exp
        '''
        ret = f"{self.value}"
        return ret

# *** DISPATCHES ***
class Dispatch(Expression):
    '''
    Dispatch base class
    Inherited by DynamicDispatch, SelfDispatch, and StaticDispatch
    '''
    def __init__(self, _in_class, _lineno, _type_of, _method_name, _formals):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.method_name = _method_name
        self.formals = _formals

class DynamicDispatch(Dispatch):
    '''
    Dynamic dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _in_class, _lineno, _type_of, _obj_name, _method_name, _formals):
        Dispatch.__init__(self, _in_class, _lineno, _type_of, _method_name, _formals)
        self.obj_name = _obj_name

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\ndynamic_dispatch\n{self.obj_name}\n"
        ret += f"{self.method_name.lineno}\n{self.method_name}\n{len(self.formals)}"

        if len(self.formals) != 0:
            ret += "\n"

            for i, formal in enumerate(self.formals):
                ret += f"{formal}"
                if i != len(self.formals) - 1:
                    ret += "\n"

        return ret

class StaticDispatch(Dispatch):
    '''
    Static dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _in_class, _lineno, _type_of, _obj_name, _typename, _method_name, _formals):
        Dispatch.__init__(self, _in_class, _lineno, _type_of, _method_name, _formals)
        self.obj_name = _obj_name
        self.typename = _typename

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nstatic_dispatch\n{self.obj_name}\n"
        ret += f"{self.typename.lineno}\n{self.typename}\n"
        ret += f"{self.method_name.lineno}\n{self.method_name}\n{len(self.formals)}"

        if len(self.formals) != 0:
            ret += "\n"

            for i, formal in enumerate(self.formals):
                ret += f"{formal}"
                if i != len(self.formals) - 1:
                    ret += "\n"

        return ret

class SelfDispatch(Dispatch):
    '''
    Self dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _in_class, _lineno, _type_of, _method_name, _formals):
        Dispatch.__init__(self, _in_class, _lineno, _type_of, _method_name, _formals)

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nself_dispatch\n"
        ret += f"{self.method_name.lineno}\n{self.method_name}\n{len(self.formals)}"

        if len(self.formals) != 0:
            ret += "\n"
            for i, formal in enumerate(self.formals):
                ret += f"{formal}"
                if i != len(self.formals) - 1:
                    ret += "\n"

        return ret

# *** EXPRESSIONS OPERATIONS ***
class Unary(Expression):
    '''
    Unary operation base class
    Inherits from Expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _rhs):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.rhs = _rhs

    def print(self):
        '''
        Base print for unary nodes
        '''
        ret = f"{self.lineno}\n{self.type_of}\n{self.rhs}"
        return ret

class Binary(Unary):
    '''
    Binary operation base class
    Inherits from unary
    '''
    def __init__(self, _in_class, _lineno, _type_of, _operation, _lhs, _rhs):
        Unary.__init__(self, _in_class, _lineno, _type_of, _rhs)
        self.operation = _operation
        self.lhs = _lhs

    def print(self):
        ret = f"{self.lineno}\n{self.type_of}\n{self.operation}\n{self.lhs}\n{self.rhs}"
        return ret

# *** UNARY EXPRESSIONS ***
class IsVoid(Unary):
    '''
    IsVoid unary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _rhs):
        Unary.__init__(self, _in_class, _lineno, _type_of, _rhs)

    def __repr__(self):
        return self.print()
    
    def exp_print(self):
        '''
        Print expr
        '''
        ret = f"isvoid {self.rhs.value}"
        return ret

class Negate(Unary):
    '''
    Negate unary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _rhs):
        Unary.__init__(self, _in_class, _lineno, _type_of, _rhs)

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nnegate\n{self.rhs}"
        return ret

class NotExpr(Unary):
    '''
    Not unary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _rhs):
        Unary.__init__(self, _in_class, _lineno, _type_of, _rhs)

    def __repr__(self):
        return self.print()

class NewExp(Unary):
    '''
    New unary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _rhs):
        Unary.__init__(self, _in_class, _lineno, _type_of, _rhs)

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nnew\n{self.rhs.lineno}\n{self.rhs}"
        return ret

class Assign(Unary):
    '''
    Assign unary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _var, _rhs):
        Unary.__init__(self, _in_class, _lineno, _type_of, _rhs)
        self.var = _var
        self.rhs = _rhs

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nassign\n{self.var.lineno}\n{self.var}\n{self.rhs}"
        return ret

# *** BINARY EXPRESSIONS ***
class Plus(Binary):
    '''
    Plus binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "plus", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Minus(Binary):
    '''
    Minus binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "minus", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Times(Binary):
    '''
    Times binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "times", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Divide(Binary):
    '''
    Divide binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "divide", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Less(Binary):
    '''
    Less binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "lt", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class LessOrEqual(Binary):
    '''
    Le binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "le", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Equals(Binary):
    '''
    Equals binary expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _in_class, _lineno, _type_of, "eq",_lhs, _rhs)

    def __repr__(self):
        return self.print()

# *** BLOCK STATEMENTS ***
class IfBlock(Expression):
    '''
    If block statement
    '''
    def __init__(self, _in_class, _lineno, _type_of, _predicate, _then_body, _else_body):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.predicate = _predicate
        self.then_body = _then_body
        self.else_body = _else_body

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nif\n{self.predicate}\n{self.then_body}\n{self.else_body}"
        return ret
    
    def exp_print(self):
        '''
        Print exp
        '''
        ret = f"if {self.predicate.exp_print()} then {self.then_body.exp_print()} "
        ret += f"else {self.else_body.exp_print()}"
        return ret

class CaseBlock(Expression):
    '''
    Case block statement
    '''
    def __init__(self, _in_class, _lineno, _type_of, _case_exp, _exps):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.case_exp = _case_exp
        self.exps = _exps

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\ncase\n{self.case_exp}\n{len(self.exps)}\n"

        for i, exp in enumerate(self.exps):
            identifier = exp[0]
            id_type = exp[1]
            exp_rem = exp[2]

            ret += f"{identifier.lineno}\n{identifier}\n{id_type.lineno}\n{id_type}\n"
            ret += f"{exp_rem}"

            if i != len(self.exps) - 1:
                ret += "\n"

        return ret

class LoopBlock(Expression):
    '''
    Loop block statement
    '''
    def __init__(self, _in_class, _lineno, _type_of, _predicate, _body):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.predicate = _predicate
        self.body = _body

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nwhile\n{self.predicate}\n{self.body}"
        return ret
    
    def exp_print(self):
        '''
        Print exp
        '''
        ret = f"while {self.predicate.exp_print()} loop {self.body.exp_print()} pool"
        return ret

class Block(Expression):
    '''
    Block expression
    '''
    def __init__(self, _in_class,  _lineno, _type_of, _num_exps, _exps):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.num_exps = _num_exps
        self.exps = _exps

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nblock\n{self.num_exps}\n"
        for i, exp in enumerate(self.exps):
            ret += f"{exp}"
            if i != self.num_exps - 1:
                ret += "\n"
        return ret

class Let(Expression):
    '''
    Let expression
    '''
    def __init__(self, _in_class, _lineno, _type_of, _let_list, _let_body):
        Expression.__init__(self, _in_class, _lineno, _type_of)
        self.let_list = _let_list
        self.let_body = _let_body

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nlet\n{len(self.let_list)}\n"

        for formal in self.let_list:
            binding_type = formal[0]
            identifier = formal[1]
            id_type = formal[2]
            expr_type = formal[3]

            ret += f"{binding_type}\n{identifier.lineno}\n{identifier}\n"
            ret += f"{id_type.lineno}\n{id_type}\n"

            if expr_type:
                ret += f"{expr_type}\n"

        ret += f"{self.let_body}"

        return ret
    
    def exp_print(self):
        '''
        Print exp
        '''
        ret = f"let ... in ..."
        return ret
