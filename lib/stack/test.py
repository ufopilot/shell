#!/usr/bin/python3
import sys
import subprocess

n=""    
script = "date.sh" 
if len(sys.argv) > 1:
    n = sys.argv[1]
script = '''
date '''+n+'''
date
'''
def capture():
    subprocess.run(["/bin/bash", "-c", script], check=True)
capture()


