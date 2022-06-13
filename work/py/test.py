from subprocess import Popen, PIPE
p = Popen('./test.sh', stdin=PIPE, shell=True,  universal_newlines=True)
#p.communicate(input='\n')
p.communicate('data_to_write')[0]
