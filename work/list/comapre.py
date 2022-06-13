d = {}
with open('1.txt', 'r') as f1, open('2.txt', 'r') as f2:
  for line in f1:
    if not line: break
    c0,c1,c2 = line.split()
    d[(c2)] = (c0,c1)

  for line in f2:
    if not line: break
    c0,c1,c2 = line.split()
    if (c2) in d: print("{}-{} {}-{} {}".format(d[(c2)][0], c0, d[(c2)][1], c1, c2))
