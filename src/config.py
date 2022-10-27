'''
All global variables
'''

# Imports
from mappings import ClassMap, ImplementationMap, ParentMap
from collections import defaultdict

# Lines from file
lines = []
# Annotated abstract syntax tree
aast = []

# Mappings
class_map = ClassMap()
impl_map = ImplementationMap()
parent_map = ParentMap()

vtable = defaultdict(lambda: defaultdict(dict))
symbol_table = defaultdict(lambda: defaultdict(dict))
