'''
All global variables
'''

# Imports
from collections import defaultdict
from mappings import ClassMap, ImplementationMap, ParentMap

# Lines from file
lines = []
# Annotated abstract syntax tree
aast = []

# Mappings
class_map = ClassMap()
impl_map = ImplementationMap()
parent_map = ParentMap()

# Map of class -> list of accessible methods
vtable = defaultdict(lambda: defaultdict(dict))
symbol_table = defaultdict(lambda: defaultdict(dict))
