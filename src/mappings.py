'''
Mappings
'''

# Imports
from collections import defaultdict

class Mapping(object):
    '''
    Base class for mappings
    '''
    def __init__(self):
        self.dict = defaultdict(list)

    def append_obj(self, class_name, attribute):
        '''
        Append an attribute to the mapping's list
        '''
        self.dict[class_name].append(attribute)


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
