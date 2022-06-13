#.replace('TEST', '?', 1)

s = [20, 39, 0, 87, 13, 0, 23, 56, 12, 13]
p = [0, 13]
bin = []

for i in p:
    bin = [s.replace(str(i), '0000', 1) for s in s] 

print(bin)

# for i in s:
#         if i in p:        
#             bin.append(1)
#             p.remove(i)      
#         else:
#             bin.append(0)
   

# print(bin)