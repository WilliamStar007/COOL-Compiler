'''
Mappings
'''

# Imports
import sys
from collections import defaultdict

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

    def keys(self):
        '''
        Returns map keys
        '''
        return self.dict.keys()

    def class_iterables(self, class_name):
        '''
        Return iterables of a class
        '''
        return self.dict[class_name]

    def size(self, class_name):
        '''
        Returns number of feature in list
        '''
        return len(self.dict[class_name])


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
            print("CLASS TAG ERROR")
            sys.exit(1)

    def get_name(self, tag):
        '''
        Gets class name from tag
        '''
        if tag in self.rev_dict:
            return self.rev_dict[tag]
        else:
            print("CLASS TAG ERROR")
            sys.exit(1)


class StringTag(object):
    '''
    Mapping for string num
    '''
    def __init__(self):
        self.fwd_dict = defaultdict(int)
        self.rev_dict = defaultdict(int)

    def add(self, cur_str):
        '''
        Add string to dicts
        '''

        if cur_str in self.rev_dict:
            return

        num = len(self.fwd_dict) + 1

        self.fwd_dict[num] = f"{cur_str}"
        self.rev_dict[cur_str] = num

    def get_str(self, num):
        '''
        Get str of certain num
        '''
        return self.fwd_dict[num]

    def get_num(self, cur_str):
        '''
        Get num of certain str
        '''
        return self.rev_dict[cur_str]

    def fwd_iterables(self):
        '''
        Gets fwd dict iterables
        '''
        return self.fwd_dict.items()

    def rev_iterables(self):
        '''
        Get rev dict iterables
        '''
        return self.rev_dict.items()

    def vals(self):
        '''
        Returns map vals
        '''
        return self.fwd_dict.values()

    def pairs(self):
        '''
        Returns a list of tuples of (string num, string val)
        '''
        contents = []
        for i in range(len(self)):
            contents.append((f"string{i + 1}", self.get_str(i + 1)))

        return contents

    def __len__(self):
        return len(self.fwd_dict)

class ObjSize(object):
    '''
    Maps object to its size
    '''
    def __init__(self):
        self.dict = defaultdict(int)

    def set(self, class_name, amt):
        '''
        Set size
        '''
        if class_name not in self.dict:
            self.dict[class_name] = amt

    def get(self, cur_class, class_name):
        '''
        Get size
        '''
        if class_name == "SELF_TYPE":
            class_name = cur_class
        if class_name not in self.dict:
            print("OBJ SIZE ERROR")
            sys.exit(1)
        return self.dict[class_name]


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
        var_name = var.identifier.name

        self.fwd_dict[class_name][var_name] = offset
        self.rev_dict[class_name][offset] = var

    def get_offset(self, class_name, var_name):
        '''
        Returns offset
        '''
        if class_name in self.fwd_dict and var_name in self.fwd_dict[class_name]:
            return self.fwd_dict[class_name][var_name]
        print("OFFSET MAP GET OFFSET ERROR")
        sys.exit(1)

    def get_obj(self, class_name, offset):
        '''
        Returns the object
        '''
        if class_name in self.rev_dict and offset in self.rev_dict[class_name]:
            return self.rev_dict[offset]

        print("OFFSETMAP GET OBJ ERROR")
        sys.exit(1)


class VTableMap(OffsetMap):
    '''
    VTable map
    '''
    def __init__(self):
        super().__init__()
        self.actual = defaultdict(lambda : defaultdict(dict))

    def set_class(self, cur_class, method_name, actual_class):
        '''
        Sets the actual class of the method
        '''
        self.actual[cur_class][method_name] = actual_class

    def get_class(self, cur_class, method_name):
        '''
        Sets the actual class of the method
        '''
        if cur_class in self.actual or method_name and method_name in self.actual[cur_class]:
            return self.actual[cur_class][method_name]
        print("ORIG VTABLE GET CLASS ERROR")
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
            print("SYMBOL TABLE POP ERROR")
            sys.exit(1)

    def top(self, class_name, var_name):
        '''
        Gets data
        '''
        if class_name in self.dict and var_name in self.dict[class_name]:
            return self.dict[class_name][var_name][-1]
        print("SYMBOL TABLE TOP ERROR")
        sys.exit(1)

    def exists(self, class_name, var_name):
        '''
        Returns true if var exists in the symbol table
        '''
        return class_name in self.dict and var_name in self.dict[class_name]

class Tracker(object):
    '''
    Tracks amounts
    '''
    def __init__(self, _amt=0):
        self.amt = _amt
        self.init = _amt

    def __len__(self):
        return self.amt

    def get(self):
        ''''
        Get amt
        '''
        return self.amt

    def increment(self, _amt=1):
        '''
        Increment amt
        '''
        self.amt += _amt

    def decrement(self):
        '''
        Decrement amt
        '''
        self.amt -= 1

    def reset(self):
        '''
        Reset
        '''
        self.amt = self.init


class MinTracker(Tracker):
    '''
    Track that keeps absolute min
    '''
    def __init__(self, _amt = 0):
        Tracker.__init__(self, _amt)
        self.min = _amt

    def decrement(self):
        '''
        Decrements
        '''
        super().decrement()
        self.min = min(self.min, self.amt)
        return self.amt

    def get_min(self):
        '''
        Returns the min
        '''
        return self.min

    def reset(self):
        '''
        Reset
        '''
        super().reset()
        self.min = self.init
