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


class Method(Feature):
    '''
    Method class. Inherits from feature
    '''
    def __init__(self, _identifier, _formals_list, _typename, _body):
        Feature.__init__(self, _identifier)
        self.formals_list = _formals_list
        self.typename = _typename
        self.body = _body


class Internal(object): # TODO: What to do with this
    '''
    A class for Internal cool objects
    This includes Bool, Int, IO, Object, and String
    '''
    def __init__(self, _method):
        self.method = _method


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


class IdentifierExp(Expression):
    '''
    Identifier expression object
    '''
    def __init__(self, _lineno, _type_of, _identifier):
        Expression.__init__(self, _lineno, _type_of)
        self.identifier = _identifier


class Integer(Expression):
    '''
    Integer expression object
    '''
    def __init__(self, _lineno, _type_of, _value):
        Expression.__init__(self, _lineno, _type_of)
        self.value = _value


class StringObj(Expression):
    '''
    String expression object
    '''
    def __init__(self, _lineno, _type_of, _value):
        Expression.__init__(self, _lineno, _type_of)
        self.value = _value


class TrueExp(Expression):
    '''
    True expression object
    '''
    def __init__(self, _lineno):
        Expression.__init__(self, _lineno, "Bool")
        self.value = "true"


class FalseExp(Expression):
    '''
    String expression object
    '''
    def __init__(self, _lineno):
        Expression.__init__(self, _lineno, "Bool")
        self.value = "false"


# *** DISPATCHES ***
class Dispatch(Expression):
    def __init__(self, _lineno, _type_of, _method_name, _formals):
        Expression.__init__(self, _lineno, _type_of)
        self.methodPname = _method_name
        self.formals = _formals


class DynamicDispatch(Dispatch):
    '''
    Dynamic dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _lineno, _type_of, _obj_name, _method_name, _formals):
        Dispatch.__init__(self, _lineno, _type_of, _method_name, _formals)
        self.obj_name = _obj_name


class StaticDispatch(Dispatch):
    '''
    Static dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _lineno, _type_of, _obj_name, _typename, _method_name, _formals):
        Dispatch.__init__(self, _lineno, _type_of, _method_name, _formals)
        self.obj_name = _obj_name
        self.typename = _typename


class SelfDispatch(Dispatch):
    '''
    Self dispatch object
    Inherits from Dispatch
    '''
    def __init__(self, _lineno, _type_of, _method_name, _formals):
        Dispatch.__init__(self, _lineno, _type_of, _method_name, _formals)


# *** EXPRESSIONS OPERATIONS ***
class Unary(Expression):
    '''
    Unary operation base class
    Inherits from Expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Expression.__init__(self, _lineno, _type_of)
        self.rhs = _rhs


class Binary(Unary):
    '''
    Binary operation base class
    Inherits from unary
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)
        self.lhs = _lhs


# *** UNARY EXPRESSIONS ***
class IsVoid(Unary):
    '''
    IsVoid unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)


class Negate(Unary):
    '''
    Negate unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

class NotExpr(Unary):
    '''
    Not unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

class NewExp(Unary):
    '''
    New unary expression
    '''
    def __init__(self, _lineno, _type_of, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)

class Assign(Unary):
    '''
    Assign unary expression
    '''
    def __init__(self, _lineno, _type_of, _var, _rhs):
        Unary.__init__(self, _lineno, _type_of, _rhs)
        self.var = _var
        self.rhs = _rhs

# *** BINARY EXPRESSIONS ***
class Plus(Binary):
    '''
    Plus binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


class Minus(Binary):
    '''
    Minus binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


class Times(Binary):
    '''
    Times binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


class Divide(Binary):
    '''
    Divide binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


class Less(Binary):
    '''
    Less binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


class LessOrEqual(Binary):
    '''
    Le binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


class Equals(Binary):
    '''
    Equals binary expression
    '''
    def __init__(self, _lineno, _type_of, _lhs, _rhs):
        Binary.__init__(self, _lineno, _type_of, _lhs, _rhs)


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


class CaseBlock(Expression):
    '''
    Case block statement
    '''
    def __init__(self, _lineno, _type_of, _case_exp, _exps):
        Expression.__init__(self, _lineno, _type_of)
        self.case_exp = _case_exp
        self.exps = _exps


class LoopBlock(Expression):
    '''
    Loop block statement
    '''
    def __init__(self, _lineno, _type_of, _predicate, _body):
        Expression.__init__(self, _lineno, _type_of)
        self.predicate = _predicate
        self.body = _body


class Block(Expression):
    '''
    Block expression
    '''
    def __init__(self, _lineno, _type_of, _num_exps, _exps):
        Expression.__init__(self, _lineno, _type_of)
        self.num_exps = _num_exps
        self.exps = _exps


class Let(Expression):
    '''
    Let expression
    '''
    def __init__(self, _lineno, _type_of, _let_list, _let_body):
        Expression.__init__(self, _lineno, _type_of)
        self.let_list = _let_list
        self.let_body = _let_body
