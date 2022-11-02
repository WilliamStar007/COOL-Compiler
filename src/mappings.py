'''
Mappings
'''

# Imports
from collections import defaultdict

# *** MAP NODES ***
class MapAttr(object):
    '''
    Attribute object for the class map
    '''
    def __init__(self, _id, _type, _init=None):
        self.id = _id
        self.type = _type
        self.init = _init


class MapMethod(object):
    '''
    Method object for the implementation map
    '''
    def __init__(self, _method_name, _formals, _method_label):
        self.method_name = _method_name
        self.formals = _formals
        self.method_label = _method_label


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

    def set_num(self, _new_amt):
        '''
        Set the new amount
        '''
        self.amt = _new_amt


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
        out_str = f"implementation_map\n{len(self.dict)}" # TODO: DOES NOT HAVE LEN

        for class_name, methods in self.dict.items():
            out_str += f"{class_name}\n{len(methods)}\n"

            for method in methods:
                out_str += f"{method.method_name}\n"

                for formal in method.formals:
                    out_str += f"{formal}\n"

                # TODO: SHOULD BE METHOD BODY TO MATCH
                out_str += f"{class_name}\n{method.method_label}\n"

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
