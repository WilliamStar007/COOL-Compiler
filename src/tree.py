'''
Tree nodes for all the classes
These are read in from the file
'''

# *** CLASS ***
class ClassObj(object):
    pass

# *** CLASS FEATURES ***

class Feature(object):
    def __init__(self, _lineno):
        self.lineno = _lineno

#class Attribute(Feature):
#    def __init__(self, _lineno, _id, _type, _init=None):
#        Feature.__init__(self, _lineno)
#        self.id = _id
#        self.type = _type
#        self.init = _init

class Method(Feature):
    def __init__(self, _method_name, _formals, _method_label):
        self.method_name = _method_name
        self.formals = _formals
        self.method_label = _method_label

class MethodImplementation(Method):
    def __init__(self, _class_name, _method_name, _formals, _method_label, _expr):
        Method.__init__(self, _method_name, _formals, _method_label)
        self.class_name = _class_name
        self.expr = _expr

class Internal(object):
    def __init__(self, _method):
        self.method = _method

# *** TERMINAL EXPRESSIONS ***
class Identifier(object):
    def __init__(self, _name):
        self.name = _name

class IdentifierExp(object):
    pass

class Int(object):
    def __init__(self, _value):
        self.value = _value

class String(object):
    pass

# *** DISPATCHES ***
class Dispatch(object):
    def __init__(self, _ro, _method, _formals):
        self.ro = _ro
        self.method = _method
        self.formals = _formals

# *** EXPRESSIONS OPERATIONS ***
class Expression(object):
    def __init__(self, _lineno, _type_of):
        self.lineno = _lineno
        self.type_of = _type_of

class Unary(object):
    def __init__(self, _rhs):
        self.rhs = _rhs

class Binary(Unary):
    def __init__(self, _lhs, _rhs):
        Unary.__init__(self, _rhs)
        self.lhs = _lhs

# *** UNARY EXPRESSIONS ***
class IsVoid(Unary):
    def __init__(self, _rhs):
        Unary.__init__(self, _rhs)

class Negate(Unary):
    def __init__(self, _rhs):
        Unary.__init__(self, _rhs)

class NotExpr(Unary):
    def __init__(self, _rhs):
        Unary.__init__(self, _rhs)

class New(Unary):
    def __init__(self, _typename):
        self.new_type = _typename

class Assign(Unary):
    def __init__(self, _var, _rhs):
        Unary.__init__(self, _rhs)
        self.var = _var

# *** BINARY EXPRESSIONS ***
class Plus(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

class Minus(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

class Times(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

class Divide(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

class Less(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

class LessOrEqual(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

class Equals(Binary):
    def __init__(self, _lhs, _rhs):
        Binary.__init__(self, _lhs, _rhs)

# *** BLOCK STATEMENTS ***
class IfBlock(object):
    pass

class CaseBlock(object):
    pass

class LoopBlock(object):
    pass

class Block(object):
    pass

class Let(object):
    pass
