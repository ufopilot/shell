import subprocess
with subprocess.Popen("bash /opt/dev/shell/work/py/test.sh", shell = True, stdin = subprocess.PIPE, stdout = subprocess.PIPE, stderr = subprocess.PIPE, universal_newlines = False) as con:
    try:
        for line in iter(con.stdout.readline, ""):
            if "enter" in line.decode().strip().split():
                print(line.decode().strip())
                sleep(2)
                con.stdin.write('\n')  
    except:
        pass
# or con.communicate('\n')
