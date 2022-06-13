import pprint

with open('1.txt', 'r') as f1, open('2.txt', 'r') as f2:
    for row1 in f1:
        ar1 = row1.split(" ")
        for row2 in f2:
            ar2 = row2.split(" ")
            if ar1[2] == ar2[2]:
                print("{}-{} {}-{} {}".format(ar1[0], ar2[0], ar1[1], ar2[1], ar1[2]))
