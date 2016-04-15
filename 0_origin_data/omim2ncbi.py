fin = 'mim2gene_2016_2_24.txt'
fout = 'omim2ncbi_2016_2_24.txt'
f=open(fin,'r')
f2=open(fout,'w')
for line in f.readlines():
	if line.split()[1]=='gene':
		if len(line.split())>=3:
			f2.write(line.split()[0])
			f2.write(' ')
			f2.write(line.split()[2])
			f2.write('\n')
