'''
All global variables
'''

# Imports
from mappings import Tracker, \
                     ClassMap,\
                     ClassTag,\
                     StringTag,\
                     ImplementationMap, \
                     MinTracker, \
                     ObjSize, \
                     OffsetMap, \
                     ParentMap, \
                     SymbolTable, \
                     VTableMap

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
string_tag = StringTag()
vtable_map = VTableMap()
attr_map = OffsetMap()
symbol_table = SymbolTable()
obj_size = ObjSize()

# Trackers
dynamic = Tracker(0)
rbp_offset = MinTracker(0)
jump_table = Tracker(1)

OFFSET_AMT = 8
SPC = f"{'':24}"
