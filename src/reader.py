'''
This file deserializes an annotated abstract syntax tree
'''

from tree import *
import config

cur_class = ""

def read_identifier():
    '''
    Reads identifiers
    '''
    lineno = get_line()
    ident_name = get_line()
    return Identifier(cur_class, lineno, ident_name)


def read_formal():
    '''
    Reads in formals
    '''
    formal_name = read_identifier()
    formal_type = read_identifier()
    return (formal_name, formal_type)


def read_exp():
    '''
    Reads in expressions
    '''
    lineno = get_line()
    type_of = get_line()
    exp_name = get_line()

    ### ASSIGNMENT
    if exp_name == 'assign':
        var = read_identifier()
        rhs = read_exp()
        return Assign(cur_class, lineno, type_of, var, rhs)

    ### DISPATCH EXPRESSIONS
    elif exp_name == 'dynamic_dispatch':
        obj_name = read_exp()
        method_name = read_identifier()
        num_args = int(get_line())
        args = [] # list for building up the arguments in the method call
        for _ in range(num_args):
            args.append(read_exp())
        return DynamicDispatch(cur_class, lineno, type_of, obj_name, method_name, args)

    elif exp_name == 'static_dispatch':
        obj_name = read_exp()
        type_name = read_identifier()
        method_name = read_identifier()
        num_args = int(get_line())
        args = []
        for _ in range(num_args):
            args.append(read_exp())
        return StaticDispatch(cur_class, lineno, type_of, obj_name, type_name, method_name, args)

    elif exp_name == 'self_dispatch':
        method_name = read_identifier()
        num_args = int(get_line())
        args = []
        for _ in range(num_args):
            args.append(read_exp())
        return SelfDispatch(cur_class, lineno, type_of, method_name, args)

    ### IF, WHILE, BLOCK
    elif exp_name == 'if':
        predicate = read_exp()
        then_body = read_exp()
        else_body = read_exp()
        return IfBlock(cur_class, lineno, type_of, predicate, then_body, else_body)

    elif exp_name == 'while':
        predicate = read_exp()
        body_exp = read_exp()
        return LoopBlock(cur_class, lineno, type_of, predicate, body_exp)

    elif exp_name == 'block':
        num_exps = int(get_line())
        exps = []
        for _ in range(num_exps):
            exps.append(read_exp())
        return Block(cur_class, lineno, type_of, num_exps, exps)

    ### UNARY AND BINARY OPERATIONS
    elif exp_name == 'new':
        return NewExp(cur_class, lineno, type_of, read_identifier())
    elif exp_name == 'isvoid':
        return IsVoid(cur_class, lineno, type_of, read_exp())
    elif exp_name == 'plus':
        return Plus(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'minus':
        return Minus(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'times':
        return Times(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'divide':
        return Divide(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'lt':
        return Less(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'le':
        return LessOrEqual(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'eq':
        return Equals(cur_class, lineno, type_of, read_exp(), read_exp())
    elif exp_name == 'not':
        return NotExpr(cur_class, lineno, type_of, read_exp())
    elif exp_name == 'negate':
        return Negate(cur_class, lineno, type_of, read_exp())

    ### TYPES and identifier
    elif exp_name == 'integer':
        return Integer(cur_class, lineno, type_of, int(get_line()))
    elif exp_name == 'string':
        obj = StringObj(cur_class, lineno, type_of, get_line())
        return obj
    elif exp_name == 'identifier':
        return IdentifierExp(cur_class, lineno, type_of, read_identifier())
    elif exp_name == 'internal':
        desc = get_line()
        return Internal(cur_class, lineno, type_of, exp_name, desc)
    elif exp_name == 'true':
        return Bool(cur_class, lineno, "true")
    elif exp_name == 'false':
        return Bool(cur_class, lineno, "false")

    ### LET EXPRESSIONS
    if exp_name == 'let':
        num_bindings = int(get_line())
        binding_list = []
        for _ in range(num_bindings):
            binding_type = get_line()
            ident_name = read_identifier()
            ident_type = read_identifier()
            if binding_type == 'let_binding_init':
                ident_val = read_exp()
                binding_list.append((binding_type, ident_name, ident_type, ident_val))
            elif binding_type == 'let_binding_no_init':
                binding_list.append((binding_type, ident_name, ident_type, None))
        return Let(cur_class, lineno, type_of, binding_list, read_exp())

    ### CASE EXPRESSIONS
    elif exp_name =='case':
        case_exp = read_exp()
        num_cases = int(get_line())
        case_list = []
        for _ in range(num_cases):
            case_ele_var = read_identifier()
            case_ele_type = read_identifier()
            case_ele_body = read_exp()
            case_list.append((case_ele_var, case_ele_type, case_ele_body))
        return CaseBlock(cur_class, lineno, type_of, case_exp, case_list)


def read_feature():
    '''
    Reads in attributes and methods
    '''
    feature_kind = get_line()

    if feature_kind == 'attribute_no_init':
        feature_name = read_identifier()
        feature_type = read_identifier()
        return Attribute(cur_class, feature_name, feature_type)

    elif feature_kind == 'attribute_init':
        feature_name = read_identifier()
        feature_type = read_identifier()
        feature_init = read_exp()
        return Attribute(cur_class, feature_name, feature_type, feature_init)

    elif feature_kind == 'method':
        feature_name = read_identifier()
        formals_list = []

        num_formals = int(get_line())
        formals_list.append(num_formals)
        for _ in range(num_formals):
            formals_list.append(read_formal())

        feature_type = read_identifier()
        feature_body = read_exp()
        return Method(cur_class, feature_name, formals_list, feature_type, feature_body)


def read_class():
    '''
    Reads in classes
    '''
    class_info = read_identifier()
    global cur_class
    cur_class = class_info.name
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
    global cur_class
    cur_class = class_name
    num_attrs = int(get_line())

    config.class_map.init_obj(class_name)

    for _ in range(num_attrs):
        attr = None
        var_name = None
        var_type = None
        val = None

        attr_type = get_line()
        var_name = get_line()
        var_type = get_line()
        if attr_type == "initializer":
            val = read_exp()
        var_name = Identifier(cur_class, 0, var_name)
        var_type = Identifier(cur_class, 0, var_type)
        attr = Attribute(cur_class, var_name, var_type, val)
        config.class_map.append_obj(class_name, attr)


def read_implementation_map():
    '''
    Reads in the implementation map
    '''
    class_name = get_line()
    global cur_class
    cur_class = class_name
    num_methods = int(get_line())

    for _ in range(num_methods):
        method_name = get_line()
        method_name = Identifier(cur_class, 0, method_name)
        num_formals = int(get_line())

        formals = []
        for _ in range(num_formals):
            formal = get_line()
            formals.append(formal)

        method_class_name = get_line()

        body = read_exp()

        method = Method(method_class_name, method_name, num_formals, formals, body)
        config.impl_map.append_obj(class_name, method)


def read_parent_map():
    '''
    Reads in the parent map
    '''
    class_name = get_line()
    parent_name = get_line()

    config.parent_map.append_obj(class_name, parent_name)


def get_class_map():
    '''
    Deserializes the class map
    '''

    _ = get_line()
    num_attrs = int(get_line())

    config.class_map.set_num(num_attrs)

    for _ in range(num_attrs):
        read_class_map()

    raw_bool = Attribute("Bool", Identifier("Bool", 0, "(raw content)"), Identifier("Bool", 0, "Int"), None)
    raw_int = Attribute("Int", Identifier("Int", 0, "(raw content)"), Identifier("Int", 0, "Int"), None)
    raw_string = Attribute("String", Identifier("String", 0, "(raw content)"), Identifier("String", 0, "String"), None)
    config.class_map.append_obj('Bool', raw_bool)
    config.class_map.append_obj('Int', raw_int)
    config.class_map.append_obj('String', raw_string)


def read_input():
    '''
    Reads all input
    '''

    # Process class ma
    get_class_map()

    # Process implementation map
    _ = get_line()
    num_methods = int(get_line())

    config.impl_map.set_num(num_methods)

    for _ in range(num_methods):
        read_implementation_map()

    # Process parent map
    _ = get_line()
    num_classes = int(get_line())

    for _ in range(num_classes):
        read_parent_map()

    # Process AAST
    num_classes = get_line()
    config.aast.append(num_classes)

    for _ in range(int(num_classes)):
        config.aast.append(read_class())
