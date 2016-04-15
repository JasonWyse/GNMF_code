f=open('mgi2ncbi.txt','r')
f2=open('mgi2ncbi','w')
for line in f.readlines():
	if(len(line.split())==2):
		f2.write(line.split()[0][4:11])
		f2.write(' ')
		f2.write(line.split()[1])
		f2.write('\n')
