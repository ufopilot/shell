#import pandas as pd
#df = pd.read_csv('a.txt')
#with open("a.txt","r") as f:
#    rows = list(f)
#    print(rows)
import csv

with open('a.txt') as f:
    reader = csv.reader(f, delimiter=' ')
    for row in reader:
        print(" ".join([row[0], row[2], row[3], row[1], row[4]]))
