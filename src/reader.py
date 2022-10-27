from mappings import MapAttr, MapMethod, MapParent
from tree import *
import config

def read_identifier():  # identifier format in .cl-ast file:
    lineno = get_line()        # 2 -> linenumber
    ident_name = get_line()    # x -> identifier name
    return Identifier(lineno, ident_name)

# following structure of formal output in .cl-ast file
def read_formal(): 
    formal_name = read_identifier()
    formal_type = read_identifier()
    return (formal_name, formal_type)

# method for reading all the different types of expressions
def read_exp(): 
    lineno = get_line() # all expressions start with a line number and name
    exp_name = get_line()

    ### ASSIGNMENT
    if exp_name == 'assign': 
        var = read_identifier()
        rhs = read_exp()
        return Assignment(lineno, exp_name, var, rhs)

    ### DISPATCH EXPRESSIONS
    elif exp_name == 'dynamic_dispatch':
        obj_name = read_exp()
        method_name = read_identifier()
        num_args = int(get_line())
        args = [] # list for building up the arguments in the method call
        for _ in range(num_args):
            args.append(read_exp())
        return DynamicDispatch(lineno, obj_name, method_name, args)

    elif exp_name == 'static_dispatch':
        obj_name = read_exp()
        type_name = read_identifier()
        method_name = read_identifier()
        num_args = int(get_line())
        args = [] 
        for i in range(num_args):
            args.append(read_exp()) 
        return StaticDispatch(lineno, obj_name, type_name, method_name, args)

    elif exp_name == 'self_dispatch':
        method_name = read_identifier()
        num_args = int(get_line())
        args = [] 
        for i in range(num_args):
            args.append(read_exp())
        return SelfDispatch(lineno, method_name, args) 

    ### IF, WHILE, BLOCK
    elif exp_name == 'if':
        predicate = read_exp()
        then_body = read_exp()
        else_body = read_exp()
        return IfBlock(lineno, exp_name, predicate, then_body, else_body)

    elif exp_name == 'while':
        predicate = read_exp()
        body_exp = read_exp()
        return Loop(lineno, exp_name, predicate, body_exp)

    elif exp_name == 'block':
        num_exps = int(get_line())
        exps = []
        for i in range(num_exps):
            exps.append(read_exp())
        return Block(lineno, exp_name, num_exps, exps)

    ### UNARY AND BINARY OPERATIONS
    elif exp_name == 'new':
        return NewExp(lineno, exp_name, read_identifier())
    elif exp_name == 'isvoid':
        return IsVoid(lineno, exp_name, read_exp())
    elif exp_name == 'plus':
        return Plus(lineno, read_exp(), read_exp())
    elif exp_name == 'minus':
        return Minus(lineno, exp_name, read_exp(), read_exp())
    elif exp_name == 'times':
        return Times(lineno, exp_name, read_exp(), read_exp())
    elif exp_name == 'divide':
        return Divide(lineno, exp_name, read_exp(), read_exp())
    elif exp_name == 'lt':
        return Lt(lineno, exp_name, read_exp(), read_exp())
    elif exp_name == 'le':
        return Le(lineno, exp_name, read_exp(), read_exp())
    elif exp_name == 'eq':
        return Equals(lineno, exp_name, read_exp(), read_exp()) 
    elif exp_name == 'not':
        return NotExpr(lineno, exp_name, read_exp())
    elif exp_name == 'negate':
        return Negate(lineno, exp_name, read_exp())

    ### TYPES and identifier
    elif exp_name == 'integer':
        return Integer(lineno, int(get_line())) ### Uncomment to create int AST class node
    elif exp_name == 'string':
        return StringObj(lineno, get_line())
    elif exp_name == 'identifier':
        return IdentifierExp(lineno, read_identifier())
    elif exp_name == 'true':
        return TrueExp(lineno) ### Uncomment to create a true AST class node
    elif exp_name == 'false':
        return FalseExp(lineno)

    ### LET EXPRESSIONS
    if exp_name == 'let':
        num_bindings = int(get_line())
        binding_list = []
        for i in range(num_bindings): # iterating through the different variable bindings in the let expression
            binding_type = get_line()
            ident_name = read_identifier()
            ident_type = read_identifier()
            if binding_type == 'let_binding_init':
                ident_val = read_exp()
                binding_list.append((binding_type, ident_name, ident_type, ident_val))
            elif binding_type == 'let_binding_no_init':
                binding_list.append((binding_type, ident_name, ident_type, None))
        return Let(lineno, binding_list, read_exp())

    ### CASE EXPRESSIONS
    elif exp_name =='case':
        case_exp = read_exp()
        num_cases = int(get_line())
        case_list = []
        for i in range(num_cases):
            case_ele_var = read_identifier()
            case_ele_type = read_identifier()
            case_ele_body = read_exp()
            case_list.append((case_ele_var, case_ele_type, case_ele_body))
        return CaseBlock(lineno, exp_name, case_exp, case_list)

def read_feature():
    feature_kind = get_line()

    if feature_kind == 'attribute_no_init':
        feature_name = read_identifier()
        feature_type = read_identifier()
        return AttributeNoInit(feature_name, feature_type)

    elif feature_kind == 'attribute_init':
        feature_name = read_identifier()
        feature_type = read_identifier()
        feature_init = read_exp()
        return AttributeInit(feature_name, feature_type, feature_init)

    elif feature_kind == 'method':
        feature_name = read_identifier()
        formals_list = []

        num_formals = int(get_line())
        formals_list.append(num_formals)
        for i in range(num_formals):
            formals_list.append(read_formal())

        feature_type = read_identifier()
        feature_body = read_exp()
        return Method(feature_name, formals_list, feature_type, feature_body)


def read_class():
    class_info = read_identifier()
    check_inherits = get_line()
    parent = None
    if check_inherits == 'inherits':
        parent = read_identifier()

    num_features = int(get_line())
    feature_list = []
    feature_list.append(num_features)
    for _ in range(num_features):
        feature_list.append(read_feature())

    return ClassObj(class_info, check_inherits, parent, feature_list)


def get_line():
    '''
    Gets a line
    '''
    return config.lines.pop(0)


def read_class_map():
    '''
    Reads in the class map
    '''
    class_name = get_line()
    num_attrs = get_line()

    for _ in range(num_attrs):
        attr = None
        var_name = None
        var_type = None
        val = None

        attr_type = get_line()
        if attr_type == "initializer":
            var_name = get_line()
            var_type = get_line()
            val = read_exp
        elif attr_type == "no_initializer":
            var_name = get_line()
            var_type = get_line()
            _ = get_line() # TODO: Don't know what to do with this
        attr = MapAttr(var_name, var_type, val)
        config.class_map.append_obj(class_name, attr)


def read_implementation_map():
    '''
    Reads in the implementation map
    '''
    class_name = get_line()
    num_methods = get_line()

    for _ in range(num_methods):
        method_name = get_line()
        num_formals = get_line()

        formals = []
        for i in range(num_formals):
            formal = get_line()
            formals.append(formal)

        _ = get_line()
        _ = read_exp()

        method = MapMethod(method_name, formals, method_name) # TODO: Wrong
        config.impl_map.append_obj(class_name, method)


def read_parent_map():
    '''
    Reads in the parent map
    '''
    num_classes = get_line()

    for _ in range(num_classes):
        class_name = get_line()
        parent_name = get_line()

        config.parent_map.append_obj(class_name, parent_name)


def read_input():
    '''
    Reads all input
    '''

    # Process class map
    _ = get_line()
    num_attrs = get_line()

    for _ in range(num_attrs):
        read_class_map()

    # Process implementation map
    _ = get_line()
    num_methods = get_line()

    for _ in range(num_methods):
        read_implementation_map()

    # Process parent map
    _ = get_line()
    num_classes = get_line()

    for _ in range(num_classes):
        read_parent_map()

    # Process AAST
    num_classes = get_line()
    config.aast.append(num_classes)

    for _ in range(int(num_classes)):
        config.aast.append(read_class())
