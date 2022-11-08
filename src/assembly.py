'''
This file has all assembly logic
'''

from collections import defaultdict
import config
from memory import RSP, RBP, RSI, RDI, RNum, RXX
from tree import *
import heapq as hq
import constant_prints

rsp = RSP()
rbp = RBP()
rsi = RSI()
rdi = RDI()

rax = RXX('a')

r12 = RNum(12)
r13 = RNum(13)
r14 = RNum(14)


def cgen(exp, ident=None):
    '''
    Code generation
    Recursively defined
    '''

    ret = ""

    # ***** ATTRIBUTES *****
    if isinstance(exp, Attribute): # TODO: Def a better way to do this
        if exp.identifier.name == "(raw content)":
            obj = "0" if exp.typename.name == "Int" else "the.empty.string"
            ret += f"movq ${obj}, {r13}"

        else:
            if exp.typename.name in ["Bool", "Int", "String"]:
                return cgen(Expression(exp.in_class, 0, exp.typename.name))
            else: # i.e. is an identifier
                ret += f"movq $0, {r13}"

    # ***** EXPRESSION TERMINALS *****

    # Int
    elif isinstance(exp, Integer):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Int'))}\n"
        ret += f"movq ${exp.value}, {r14}\n"

        # TODO: Find offset for the last line

        offset = None
        reg = None

        if ident: # TODO: Hardcode this less
            tpl = config.symbol_table.top(exp.in_class, ident)
            offset = tpl[0] * config.OFFSET_AMT
            reg = tpl[1]
        else:
            offset = 24
            reg = r12

        ret += f"movq {r14}, 24({r13})\n"
        ret += f"movq {r13}, {offset}({reg})"

    # String
    elif isinstance(exp, StringObj):
        ret += f"{cgen(Expression(exp.in_class, 0, 'String'))}\n"
        ret += "FIXIXIFSFJONFD" # TODO: FIX


    # True exp
    elif isinstance(exp, Bool):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Bool'))}\n"
        ret += "FINISH" # TODO FINISH


    # Identifier exp
    elif isinstance(exp, IdentifierExp):
        pass


    # Identifier
    elif isinstance(exp, Identifier):
        pass


    # ***** EXPRESSION UNARY OPS *****

    # IsVoid
    elif isinstance(exp, IsVoid):
        pass


    # Negate
    elif isinstance(exp, Negate):
        pass


    # ***** EXPRESSION BINARY OPS *****


    # ***** EXPRESSION BLOCKS *****

    # Block
    elif isinstance(exp, Block):
        for i, sub_exp in enumerate(exp.exps):
            ret += f"{cgen(sub_exp)}"
            if i < exp.num_exps - 1:
                ret += "\n"

    # If
    elif isinstance(exp, IfBlock):
        pass


    # Loop
    elif isinstance(exp, LoopBlock):
        pass

    # ***** EXPRESSION DISPATCHES *****


    # ***** EXPRESSION BASE CLASS *****
        # Expression base class
    elif isinstance(exp, Expression):
        if exp.type_of in ["Bool", "Int", "String"]:
            ret += f"## new {exp.type_of}\n"
            ret += f"pushq {rbp}\n"
            ret += f"pushq {r12}\n"
            ret += f"movq ${exp.type_of}..new, {r14}\n"
            ret += f"call *{r14}\n"
            ret += f"popq {r12}\n"
            ret += f"popq {rbp}"

    return ret


def print_vtables():
    '''
    Print program vtables
    '''
    str_num = 1
    ret = "\t\t\t## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    for key, val in config.impl_map.iterables():
        ret += f".globl {key}..vtable\n"

        tmp = f"{key}..vtable:"
        ret += f"{tmp:24}## virtual function table for {key}\n"
        ret += f"\t\t\t.quad string{str_num}\n"
        ret += f"\t\t\t.quad {key}..new\n"

        cur_offset = 2

        for method in val:
            ret += f"\t\t\t.quad {method.in_class}.{method.identifier}\n"
            config.vtable_map.set_offset(key, method, cur_offset)
            cur_offset += 1

        ret += "\t\t\t## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
        str_num += 1

    return ret

def print_ctors():
    '''
    Print program constructors
    '''
    ret = ""

    class_names = []
    for key, _ in config.class_map.iterables():
        class_names.append(key)
        config.str_num_contents[len(config.str_num_contents) + 1] = key

    config.class_tags.assemble_dicts(class_names)


    for key, val in config.class_map.iterables():
        ret += f".globl {key}..new\n"
        tmp = f"{key}..new:"
        ret += f"{tmp:24}## constructor for {key}\n"

        ret += f"pushq {rbp}\n"
        ret += f"movq {rsp}, {rbp}\n"

        ret += "## stack room for temporaries: 1\n"
        ret += f"movq $8, {r14}\n"
        ret += f"subq {r14}, {rsp}\n"

        ret += "## return address handling\n"
        ret += f"movq ${3 + len(val)}, {r12}\n"
        ret += f"movq $8, {rsi}\n"
        ret += f"movq {r12}, {rdi}\n"
        ret += "call calloc\n"
        ret += f"movq {rax}, {r12}\n"

        ret += "## store class tag, object size and vtable pointer\n"

        # Class tag
        r12.update_offset(0)
        ret += f"movq ${config.class_tags.get_tag(key)}, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"

        r12.update_offset(8)

        # Object size
        ret += f"movq ${3 + len(val)}, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"
        r12.update_offset(16)

        # Vtable
        # TODO: Don't include vtable if DNE
        ret += f"movq ${key}..vtable, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"
        r12.update_offset(24)

        if len(val) != 0:
            ret += "## initialize attributes\n"
            cur_offset = 3
            for attr in val:
                ret += f"## self[{cur_offset}] holds field {attr.identifier} ({attr.typename})\n"

                ret += f"{cgen(attr)}\n"

                ret += f"movq {r13}, {r12.pwo()}\n"
                config.attr_map.set_offset(key, attr, cur_offset) # TODO: Not needed. Is a bit redundant
                config.symbol_table.add(key, attr.identifier.name, cur_offset, r12)

                r12.update_offset(r12.offset + 8)
                cur_offset += 1


        self_offset = 3
        for attr in val:
            ret += f"## self[{self_offset}] {attr.identifier} initializer "
            if not attr.expr:
                ret += "-- none\n"
            else:
                ret += f"<- {attr.expr.value}\n"
                ret += f"{cgen(attr.expr, attr.identifier.name)}\n"
            self_offset += 1

            r12.update_offset()

        ret += f"movq {r12}, {r13}\n"
        ret += "## return address handling\n"
        ret += f"movq {rbp}, {rsp}\n"
        ret += f"popq {rbp}\n"
        ret += "ret\n"
        ret += "## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    return ret


def print_methods():
    '''
    Prints global methods
    '''

    ordering = top_sort()

    ret = ""

    for cls in ordering:
        class_name = cls.class_info.name
        if class_name == "IO":
            ret += f"{constant_prints.IO_IN_INT}\n{constant_prints.IO_IN_STRING}\n"
            ret += f"{constant_prints.IO_OUT_INT}\n{constant_prints.IO_OUT_STRING}\n"
            continue
        elif class_name == "Object":
            ret += f"{constant_prints.OBJ_ABORT}\n{constant_prints.OBJ_COPY}\n"
            ret += f"{constant_prints.OBJ_TYPE_NAME}\n"
            continue
        elif class_name == "String":
            ret += f"{constant_prints.STR_CONCAT}\n{constant_prints.STR_LENGTH}\n"
            ret += f"{constant_prints.STR_SUBSTR}\n"
            continue

        for feature in cls.feature_list:
            if not isinstance(feature, Method):
                continue
            method_info = f"{class_name}.{feature.identifier.name}"

            ret += f".globl {method_info}\n"
            ret += f"{method_info}:\t\t\t## method definition\n" #TODO SPACING
            ret += f"pushq {rbp}\n"
            ret += f"movq {rsp}, {rbp}\n"
            # TODO: Where does this 16 come from?
            ret += f"movq 16({rbp}), {r12}\n"

            num_formals = feature.formals_list[0] #TODO: NEED ANY LET EXPRS TOO

            ret += f"## stack room for temporaries: {num_formals}\n"
            ret += f"movq $8, {r14}\n"
            ret += f"subq {r14}, {rsp}\n"
            ret += "## return address handling\n"

            for val in config.class_map.class_iterables(class_name):
                val_name = val.identifier.name
                val_type = val.typename.name
                val_offset = config.attr_map.get_offset(class_name, val_name)
                ret += f"## self[{val_offset}] holds field {val_name} ({val_type})\n"


            cur_offset = num_formals + 2

            for formal in feature.formals_list:
                if isinstance(formal, int):
                    continue
                ret += f"## fp[{cur_offset}] holds argument {formal[0]} ({formal[1]})\n"
                cur_offset -= 1

            ret += "## method body begins\n"
            ret += f"{cgen(feature.body)}\n"

            ret += f".globl {method_info}.end\n"
            ret += f"{method_info}.end:\t\t ## method body ends\n" # TODO: SPACING
            ret += "## return address handling\n"

            ret += f"movq {rbp}, {rsp}\n"
            ret += f"popq {rbp}\n"
            ret += "ret\n"
            ret += "## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"


    return ret


def print_cool_globals():
    '''
    Prints cool globals
    '''
    ret = ""

    return ret


def top_sort():
    '''
    REPLACE TODO
    '''
    base_classes = get_base_classes()

    classes = config.aast.copy()
    classes.pop(0)
    for cls in base_classes:
        classes.append(cls)

    return helper(classes)


def helper(classes):
    '''
    Helper for toposort. TODO Clean this up
    '''
    incoming_edges = defaultdict(int)
    graph = defaultdict(list)
    name_to_obj = defaultdict(ClassObj)

    for cls in classes:
        class_name = cls.class_info.name
        name_to_obj[class_name] = cls
        incoming_edges[class_name] = 0

    for cls in classes:
        class_name = cls.class_info.name
        if class_name not in graph:
            graph[class_name] = []

        if class_name == "Main":
            graph["IO"].append(class_name)
            graph["Object"].append(class_name)
            incoming_edges[class_name] += 2
        elif class_name == "Object":
            continue

        parent = "Object" if not cls.parent else cls.parent.name
        if class_name not in graph[parent]:
            graph[parent].append(class_name)
            incoming_edges[class_name] += 1

    queue = []
    for key, val in incoming_edges.items():
        if val == 0:
            hq.heappush(queue, key)

    toposort = []

    while len(queue) != 0:
        name = hq.heappop(queue)
        toposort.append(name)

        for neighbor in graph[name]:
            incoming_edges[neighbor] -= 1
            if incoming_edges[neighbor] == 0:
                hq.heappush(queue, neighbor)

    for key, val in incoming_edges.items():
        if not val == 0:
            print("ERROR")
            exit(1)

    ret = []

    for class_name in toposort:
        ret.append(name_to_obj[class_name])

    return ret


def get_base_classes():
    '''
    Assembles the base classes
    '''

    abort_method = Method("Object", \
                   Identifier("Object", 0, "abort"),\
                   [0], \
                   Identifier("Object", 0, "Object"),
                   None)
    copy_method = Method("Object", \
                   Identifier("Object", 0, "copy"),\
                   [0], \
                   Identifier("Object", 0, "Object"),
                   None)
    type_name = Method("Object", \
                   Identifier("Object", 0, "type_name"),\
                   [0], \
                   Identifier("Object", 0, "Object"),
                   None)
    object_class = ClassObj(Identifier("Object", 0, "Object"), \
                      "no_inherits", \
                      None, \
                      [abort_method, copy_method, type_name]
                      )
    # Object: Methods: abort, copy, typename

    in_int = Method("IO", \
                   Identifier("IO", 0, "in_int"),\
                   [0], \
                   Identifier("IO", 0, "Int"),
                   None)
    in_string = Method("IO", \
                   Identifier("IO", 0, "in_string"),\
                   [0], \
                   Identifier("IO", 0, "String"),
                   None)
    out_int = Method("IO", \
                   Identifier("IO", 0, "out_int"),\
                   [1, (Identifier("IO", 0, "x"), Identifier("IO", 0, "Int"))], \
                   Identifier("IO", 0, "Object"),
                   None)

    out_string = Method("IO", \
                   Identifier("IO", 0, "out_string"),\
                   [1, (Identifier("IO", 0, "x"), Identifier("IO", 0, "String"))], \
                   Identifier("IO", 0, "SELF_TYPE"),
                   None)

    io_class = ClassObj(Identifier("IO", 0, "IO"), \
                      "inherits", \
                      Identifier("IO", 0, "Object"), \
                      [in_int, in_string, out_int, out_string]
                      )

    # IO: In int, in string, out int, out string

    concat = Method("String", \
        Identifier("IO", 0, "concat"),\
        [1, (Identifier("String", 0, "s"), Identifier("String", 0, "String"))], \
        Identifier("String", 0, "String"),
        None)

    length = Method("String", \
        Identifier("IO", 0, "length"),\
        [1, (Identifier("String", 0, "s"), Identifier("String", 0, "String"))], \
        Identifier("String", 0, "String"),
        None)

    substr = Method("String", \
        Identifier("IO", 0, "substr"),\
        [2, (Identifier("String", 0, "i"), Identifier("String", 0, "Int")), \
        (Identifier("String", 0, "l"), Identifier("String", 0, "Int"))], \
        Identifier("String", 0, "String"), \
        None)

    str_class = ClassObj(Identifier("String", 0, "String"), \
        "inherits", \
        Identifier("IO", 0, "Object"), \
        [concat, length, substr]
        )

    return [object_class, io_class, str_class]
