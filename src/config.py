'''
All global variables
'''

# Imports
from mappings import Tracker, \
                     ClassMap,\
                     MethodMap, \
                     ClassTag,\
                     StringTag,\
                     ImplementationMap, \
                     MinTracker, \
                     OffsetMap, \
                     ParentMap, \
                     SymbolTable, \
                     VTableMap, \
                     CurClass

# Lines from file
lines = []
# Annotated abstract syntax tree
aast = []
# Output lines
output = []

# Mappings
class_map = ClassMap()
method_map = MethodMap()
impl_map = ImplementationMap()
parent_map = ParentMap()

# Map of class -> list of accessible methods
class_tags = ClassTag()
string_tag = StringTag()
vtable_map = VTableMap()
attr_map = OffsetMap()
symbol_table = SymbolTable()

# Trackers
rbp_offset = MinTracker(0)
jump_table = Tracker(1)
cur_class = CurClass()

working_set = set()

# Output
output = []

OFFSET_AMT = 8
SPC = f"{'':24}"
