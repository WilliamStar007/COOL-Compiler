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


class MapParent(object):
    '''
    Parent object for parent map
    '''
    pass



class Mapping(object):
    '''
    Base class for mappings
    '''
    def __init__(self):
        self.dict = defaultdict(list)

    def append_obj(self, class_name, obj):
        '''
        Append an object to the mapping's list
        '''
        self.dict[class_name].append(obj)


class ClassMap(Mapping):
    '''
    AAST class map
    A mapping of a class to a list of attributes
    '''
    def __init__(self):
        Mapping.__init__(self)


class ImplementationMap(Mapping):
    '''
    AAST implementation map
    A mapping of a class to a list of methods
    '''
    def __init__(self):
        Mapping.__init__(self)


class ParentMap(Mapping):
    ''' TODO
    AAST parent map
    A mapping of a class to its parent
    '''
    def __init__(self):
        Mapping.__init__(self)
