import subprocess
command = ['bash', 'test.sh']
p = subprocess.Popen(command, shell=False, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
output = p.communicate(input='some data'.encode())[0]
#output = p.communicate([input='some data2',input='some data3'].encode())[1]
print(output)
