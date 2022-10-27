'''
Mappings
'''

# Imports
from collections import defaultdict

# *** MAP NODES ***

class MapAttr(object):
    '''
    Attrs for class map
    '''
    def __init__(self, _id, _type, _init=None):
        self.id = _id
        self.type = _type
        self.init = _init

class MapMethod(object):
    '''
    Methods for an implementation map
    '''
    pass

class MapParent(object):
    '''
    Parents for class parent map
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
