'''
All global variables
'''

# Imports
from collections import defaultdict
from mappings import ClassMap, ClassTag, ImplementationMap, OffsetMap, ParentMap, SymbolTable

# Lines from file
lines = []
# Annotated abstract syntax tree
aast = []

# Mappings
class_map = ClassMap()
impl_map = ImplementationMap()
parent_map = ParentMap()

# Map of class -> list of accessible methods
class_tags = ClassTag()
vtable_map = OffsetMap()
attr_map = OffsetMap()
symbol_table = SymbolTable()

str_num_contents = defaultdict(str)

OFFSET_AMT = 8
