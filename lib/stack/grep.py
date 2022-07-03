import re
import sys

with open(sys.argv[2],"r") as f: for l in f: if re.search(sys.argv[1], l): print(l)
