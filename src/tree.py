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
        ret = "CLASS: IMPL"
        return ret

# *** CLASS FEATURES ***
class Feature(object):
    '''
    Base class for Attribute and Method
    '''
    def __init__(self, _identifier):
        self.identifier = _identifier

class Attribute(Feature):
    '''
    Attribute class. Inherits from feature
    '''
    def __init__(self, _identifier, _typename, _expr=None):
        Feature.__init__(self, _identifier)
        self.typename = _typename
        self.expr = _expr

    def __repr__(self):
        ret = "TEMP"
        return ret

class Method(Feature):
    '''
    Method class. Inherits from feature
    '''
    def __init__(self, _identifier, _formals_list, _typename, _body):
        Feature.__init__(self, _identifier)
        self.formals_list = _formals_list
        self.typename = _typename
        self.body = _body

    def __repr__(self):
        ret = "METHOD: IMPL"
        return ret

class Internal(object):
    '''
    A class for Internal cool objects
    This includes Bool, Int, IO, Object, and String
    '''
    def __init__(self, _lineno, _type_of, _exp_name, _method_name):
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
    def __init__(self, _lineno, _type_of):
        self.lineno = _lineno
        self.type_of = _type_of

class Identifier(object):
    '''
    Identifier object
    '''
    def __init__(self, _lineno, _name):
        self.lineno = _lineno
        self.name = _name

    def __repr__(self):
        ret = f"{self.name}"
        return ret

class IdentifierExp(Expression):
    '''
    Identifier expression object
    '''
    def __init__(self, _lineno, _type_of, _identifier):
        Expression.__init__(self, _lineno, _type_of)
        self.identifier = _identifier

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\nidentifier\n"
        ret += f"{self.identifier.lineno}\n{self.identifier}"
        return ret

class Integer(Expression):
    '''
    Integer expression object
    '''
    def __init__(self, _lineno, _type_of, _value):
        Expression.__init__(self, _lineno, "integer")
        self.value = _value

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\n{self.value}"
        return ret

class StringObj(Expression):
    '''
    String expression object
    '''
    def __init__(self, _lineno, _type_of, _value):
        Expression.__init__(self, _lineno, _type_of)
        self.value = _value

    def __repr__(self):
        ret = f"{self.lineno}\n{self.type_of}\n{self.value}"
        return ret

class TrueExp(Expression):
    '''
    True expression object
    '''
    def __init__(self, _lineno):
        Expression.__init__(self, _lineno, "Bool")
        self.value = "true"

    def __repr__(self):
        ret = f"{self.lineno}\n{self.value}"
        return ret

class FalseExp(Expression):
    '''
    String expression object
    '''
    def __init__(self, _lineno):
        Expression.__init__(self, _lineno, "Bool")
        self.value = "false"

    def __repr__(self):
        ret = f"{self.lineno}\n{self.value}"
        return ret

# *** DISPATCHES ***
class Dispatch(Expression):
    '''
    Dispatch base class
    Inherited by DynamicDispatch, SelfDispatch, and StaticDispatch
    '''
    def __init__(self, _lineno, _type_of, _method_name, _formals):
        Expression.__init__(self, _lineno, _type_of)
        self.method_name = _method_name
        self.formals = _formals

class DynamicDispatch(Dispatch):
    '''
    Dynamic dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _lineno, _type_of, _obj_name, _method_name, _formals):
        Dispatch.__init__(self, _lineno, _type_of, _method_name, _formals)
        self.obj_name = _obj_name

    def __repr__(self):
        ret = f"{self.lineno}\ndynamic_dispatch\n{self.type_of}\n"
        ret += f"{self.obj_name}\n{self.method_name}\n"

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
    def __init__(self, _lineno, _type_of, _obj_name, _typename, _method_name, _formals):
        Dispatch.__init__(self, _lineno, _type_of, _method_name, _formals)
        self.obj_name = _obj_name
        self.typename = _typename

    def __repr__(self):
        ret = f"{self.lineno}\nstatic_dispatch\n{self.type_of}\n{self.obj_name}\n"
        ret += f"{self.typename}\n{self.method_name}\n"

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
    def __init__(self, _lineno, _type_of, _method_name, _formals):
        Dispatch.__init__(self, _lineno, _type_of, _method_name, _formals)

    def __repr__(self):
        ret = f"{self.lineno}\nstatic_dispatch\n{self.type_of}\n{self.method_name}\n"

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
    def __init__(self, _lineno, _type_of, _rhs):
        Expression.__init__(self, _lineno, _type_of)
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
    def __init__(self, _lineno, _type_of, _operation, _lhs, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)
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
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

    def __repr__(self):
        return self.print()

class Negate(Unary):
    '''
    Negate unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

    def __repr__(self):
        return self.print()

class NotExpr(Unary):
    '''
    Not unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

    def __repr__(self):
        return self.print()

class NewExp(Unary):
    '''
    New unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

    def __repr__(self):
        return self.print()

class Assign(Unary):
    '''
    Assign unary expression
    '''
    def __init__(self, _lineno, _type_of, _var, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)
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
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "plus", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Minus(Binary):
    '''
    Minus binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "minus", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Times(Binary):
    '''
    Times binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "times", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Divide(Binary):
    '''
    Divide binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "divide", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Less(Binary):
    '''
    Less binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "lt", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class LessOrEqual(Binary):
    '''
    Le binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "le", _lhs, _rhs)

    def __repr__(self):
        return self.print()

class Equals(Binary):
    '''
    Equals binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, "equal",_lhs, _rhs)

    def __repr__(self):
        return self.print()

# *** BLOCK STATEMENTS ***
class IfBlock(Expression):
    '''
    If block statement
    '''
    def __init__(self, _lineno, _type_of, _predicate, _then_body, _else_body):
        Expression.__init__(self, _lineno, _type_of)
        self.predicate = _predicate
        self.then_body = _then_body
        self.else_body = _else_body

    def __repr__(self):
        ret = f"if\n{self.predicate}\n{self.then_body}\n{self.else_body}"
        return ret

class CaseBlock(Expression):
    '''
    Case block statement
    '''
    def __init__(self, _lineno, _type_of, _case_exp, _exps):
        Expression.__init__(self, _lineno, _type_of)
        self.case_exp = _case_exp
        self.exps = _exps

    def __repr__(self):
        ret = "TEMP"
        return ret

class LoopBlock(Expression):
    '''
    Loop block statement
    '''
    def __init__(self, _lineno, _type_of, _predicate, _body):
        Expression.__init__(self, _lineno, _type_of)
        self.predicate = _predicate
        self.body = _body

    def __repr__(self):
        ret = f"{self.lineno}\nwhile{self.type_of}\n{self.predicate}\n{self.body}"
        return ret

class Block(Expression):
    '''
    Block expression
    '''
    def __init__(self, _lineno, _type_of, _num_exps, _exps):
        Expression.__init__(self, _lineno, _type_of)
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
    def __init__(self, _lineno, _type_of, _let_list, _let_body):
        Expression.__init__(self, _lineno, _type_of)
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
