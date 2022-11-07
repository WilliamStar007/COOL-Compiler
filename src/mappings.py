'''
Mappings
'''

# Imports
import sys
from collections import defaultdict

class MapMethod(object):
    '''
    Method object for the implementation map
    '''
    def __init__(self, _method_name, _num_formals, _formals, _method_class, _method_body):
        self.method_name = _method_name
        self.num_formals = _num_formals
        self.formals = _formals
        self.method_class = _method_class
        self.method_body = _method_body


class Mapping(object):
    '''
    Base class for mappings
    '''
    def __init__(self, _amt=0):
        self.dict = defaultdict(list)
        self.amt = _amt

    def init_obj(self, class_name):
        '''
        Ensures that an object will appear in the dictionary
        '''
        if class_name not in self.dict:
            self.dict[class_name] = []

    def append_obj(self, class_name, obj):
        '''
        Append an object to the mapping's list
        '''
        self.dict[class_name].append(obj)

    def pop_obj(self, class_name):
        '''
        Remove an object from the mapping's list
        '''
        self.dict[class_name].pop()

    def set_num(self, _new_amt):
        '''
        Set the new amount
        '''
        self.amt = _new_amt

    def iterables(self):
        '''
        Return iterables
        '''
        return self.dict.items()


class ClassMap(Mapping):
    '''
    AAST class map
    A mapping of a class to a list of attributes
    '''
    def __init__(self):
        Mapping.__init__(self)

    def __repr__(self):
        out_str = f"class_map\n{self.amt}\n"

        for class_name, attributes in self.dict.items():
            out_str += f"{class_name}\n{len(attributes)}\n"
            for attr in attributes:
                if attr.init:
                    out_str += "initializer\n"
                else:
                    out_str += "no_initializer\n"
                out_str += f"{attr.id}\n{attr.type}\n"
                if attr.init:
                    out_str += f"{attr.init}\n"

        return out_str


class ImplementationMap(Mapping):
    '''
    AAST implementation map
    A mapping of a class to a list of methods
    '''
    def __init__(self):
        Mapping.__init__(self)

    def __repr__(self):
        out_str = f"implementation_map\n{self.amt}\n"

        for class_name, methods in self.dict.items():
            out_str += f"{class_name}\n{len(methods)}\n"

            for method in methods:
                out_str += f"{method.method_name}\n{method.num_formals}\n"

                for formal in method.formals:
                    out_str += f"{formal}\n"

                out_str += f"{method.method_class}\n{method.method_body}\n"

        return out_str


class ParentMap(Mapping):
    '''
    AAST parent map
    A mapping of a class to its parent
    '''
    def __init__(self):
        Mapping.__init__(self)

    def __repr__(self):
        out_str = f"parent_map\n{len(self.dict)}"

        for class_name, parents in self.dict.items():
            out_str += f"{class_name}\n{parents[0]}\n"

        return out_str


class ClassTag(Mapping):
    '''
    Class tag
    Has map of class name to class tag and vice versa
    '''
    def __init__(self):
        Mapping.__init__(self)
        self.rev_dict = defaultdict(str)

    def assemble_dicts(self, class_names):
        '''
        Creates all dictionaries
        '''
        class_names.sort()

        num = 10

        for cls in class_names:
            if cls not in ["Bool", "Int", "String"]:
                self.dict[cls] = num
                self.rev_dict[num] = cls
                num += 1

        self.dict["Bool"] = 0
        self.rev_dict[0] = "Bool"

        self.dict["Int"] = 1
        self.rev_dict[1] = "Int"

        self.dict["String"] = 3
        self.rev_dict[3] = "String"

    def get_tag(self, class_name):
        '''
        Gets tag from class
        '''
        if class_name in self.dict:
            return self.dict[class_name]
        else:
            exit(1) # TODO: ERROR

    def get_name(self, tag):
        '''
        Gets class name from tag
        '''
        if tag in self.rev_dict:
            return self.rev_dict[tag]
        else:
            exit(1) # TODO: ERROR


class OffsetMap(object):
    '''
    Map attr offset to class
    '''
    def __init__(self):
        self.fwd_dict = defaultdict(lambda : defaultdict(dict))
        self.rev_dict = defaultdict(lambda : defaultdict(dict))

    def set_offset(self, class_name, var, offset):
        '''
        Sets offset
        '''
        var_name = var.method_name if (isinstance(var, MapMethod)) else var.identifier.name

        self.fwd_dict[class_name][var_name] = offset
        self.rev_dict[class_name][offset] = var

    def get_offset(self, class_name, var_name):
        '''
        Returns offset
        '''
        if class_name in self.fwd_dict and var_name in self.fwd_dict[class_name]:
            return self.fwd_dict[var_name]
        print("ERROR")
        sys.exit(1)

    def get_obj(self, class_name, offset):
        '''
        Returns the object
        '''
        if class_name in self.rev_dict and offset in self.rev_dict[class_name]:
            return self.rev_dict[offset]

        print("ERROR")
        sys.exit(1)

class SymbolTable(object):
    '''
    Symbol table maps
    '''
    def __init__(self):
        self.dict = defaultdict(lambda : defaultdict(list))

    def add(self, class_name, var_name, offset, register):
        '''
        Adds (offset, register) tuple to the end of the symbol table
        '''
        self.dict[class_name][var_name].append((offset, register))

    def pop(self, class_name, var_name):
        '''
        Pops off back
        '''
        if class_name in self.dict and var_name in self.dict[class_name]:
            self.dict[class_name][var_name].pop()
        else:
            print("ERROR")
            sys.exit(1)

    def top(self, class_name, var_name):
        '''
        Gets data
        '''
        if class_name in self.dict and var_name in self.dict[class_name]:
            return self.dict[class_name][var_name][-1]
        print("ERROR")
        sys.exit(1)
